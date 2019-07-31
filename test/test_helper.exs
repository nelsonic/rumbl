ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Rumbl.Repo, :manual)

defmodule Rumbl.TestHelpers do
  alias Rumbl.{
    Accounts,
    Multimedia
  }

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "Some User",
        username: "user#{System.unique_integer([:positive])}",
        password: attrs[:password] || "supersecret"
      })
      |> Accounts.register_user()
  end

  def video_fixture(%Accounts.User{} = user, attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        title: "A Title",
        url: "http://example.com",
        description: "a description"
      })

    {:ok, video} =  Multimedia.create_video(user, attrs)

    video
  end
end
