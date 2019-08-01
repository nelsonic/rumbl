defmodule RumblWeb.VideoControllerTest do
  use RumblWeb.ConnCase, async: true

  describe "with a logged-in user" do

    setup %{conn: conn, login_as: username} do
      user = user_fixture(username: username)
      conn = assign(conn, :current_user, user)

      {:ok, conn: conn, user: user}
    end

    @tag login_as: "max"
    test "lists all user's videos on index", %{conn: conn, user: user} do
      user_video  = video_fixture(user, title: "funny cats")
      other_video = video_fixture(
        user_fixture(username: "other"),
        title: "another video")

      conn = get conn, Routes.video_path(conn, :index)
      response = html_response(conn, 200)
      assert response =~ ~r/Listing Videos/
      assert response =~ user_video.title
      refute response =~ other_video.title
    end
  end

  test "requires user authentication on all actions", %{conn: conn} do
    Enum.each([
      get(conn, Routes.video_path(conn, :new)),
      get(conn, Routes.video_path(conn, :index)),
      get(conn, Routes.video_path(conn, :show, "123")),
      get(conn, Routes.video_path(conn, :edit, "123")),
      put(conn, Routes.video_path(conn, :update, "123", %{})),
      post(conn, Routes.video_path(conn, :create, %{})),
      delete(conn, Routes.video_path(conn, :delete, "123")),
    ], fn conn ->
      assert html_response(conn, 302)
      assert conn.halted
    end)
  end
end
