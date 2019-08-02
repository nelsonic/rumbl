defmodule RumblWeb.AuthTest do
  use RumblWeb.ConnCase, async: true
  alias RumblWeb.Auth

  setup %{conn: conn} do
    conn =
      conn
      |> bypass_through(RumblWeb.Router, :browser)
      |> get("/")

    {:ok, %{conn: conn}}
  end

  test "authenticate_user halts when no current_user exists", %{conn: conn} do
    conn = Auth.authenticate_user(conn, [])
    assert conn.halted
  end

  test "authenticate_user continues when the current_user exists",
    %{conn: conn} do

    conn =
      conn
      |> assign(:current_user, %Rumbl.Accounts.User{})
      |> Auth.authenticate_user([])

    refute conn.halted
  end
end
