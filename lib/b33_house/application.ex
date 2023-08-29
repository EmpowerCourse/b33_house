defmodule B33House.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      B33HouseWeb.Telemetry,
      # Start the Ecto repository
      B33House.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: B33House.PubSub},
      # Start Finch
      {Finch, name: B33House.Finch},
      # Start the Endpoint (http/https)
      B33HouseWeb.Endpoint
      # Start a worker by calling: B33House.Worker.start_link(arg)
      # {B33House.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: B33House.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    B33HouseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
