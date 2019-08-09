defmodule RumblWeb.Presence do
  use Phoenix.Presence,
    otp_app: :rumbl_web,
    pubsub_server: RumblWeb.PubSub

  def fetch(_topic, entries) do
    users =
      entries
      |> Map.keys()
      |> Rumbl.Accounts.list_users_with_ids()
      |> Enum.into(%{}, fn user ->
        {to_string(user.id), %{username: user.username}}
      end)

    for {key, %{metas: metas}} <- entries, into: %{} do
      {key, %{metas: metas, user: users[key]}}
    end
  end
end
