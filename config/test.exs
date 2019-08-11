use Mix.Config

# Configure your database
config :rumbl, Rumbl.Repo,
  username: "postgres",
  password: "postgres",
  database: "rumbl_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rumbl_web, RumblWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :pbkdf2_elixir, :rounds, 1

config :info_sys, :wolfram,
  app_id: "1234",
  http_client: InfoSys.Test.HTTPClient
