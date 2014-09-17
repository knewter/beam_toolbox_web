defmodule BeamToolboxWeb.Supervisor do
  use Supervisor

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [
      worker(BeamToolboxWeb.Synchronizer, []),
      worker(BeamToolboxWeb.Router, [], function: :start)
    ]

    # See http://elixir-lang.org/docs/stable/Supervisor.Behaviour.html
    # for other strategies and supported options
    supervise(children, strategy: :one_for_one)
  end
end
