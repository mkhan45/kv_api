defmodule KVApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    KVApi.init()

    children = [
      # Start the Telemetry supervisor
      KVApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: KVApi.PubSub},
      # Start the Endpoint (http/https)
      KVApiWeb.Endpoint
      # Start a worker by calling: KVApi.Worker.start_link(arg)
      # {KVApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KVApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KVApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
