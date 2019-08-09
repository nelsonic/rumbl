defmodule InfoSys.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Supervisor.child_spec({InfoSys.Counter, 15}, id: :long),
      Supervisor.child_spec({InfoSys.Counter, 5}, id: :short),
      Supervisor.child_spec({InfoSys.Counter, 10}, id: :medium)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_all, name: InfoSys.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
