defmodule RinhaBackendElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias RinhaBackendElixir.Workers.BatchInsert

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      RinhaBackendElixirWeb.Telemetry,
      # Start the Ecto repository
      RinhaBackendElixir.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: RinhaBackendElixir.PubSub},
      # Start the Endpoint (http/https)
      RinhaBackendElixirWeb.Endpoint,
      # Star redis client
      {Redix, {Application.get_env(:rinha_backend_elixir, :redis)[:url], [name: :redix]}},

      BatchInsert
      # Start a worker by calling: RinhaBackendElixir.Worker.start_link(arg)
      # {RinhaBackendElixir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RinhaBackendElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RinhaBackendElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
