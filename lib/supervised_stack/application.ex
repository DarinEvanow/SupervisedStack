defmodule SupervisedStack.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      { SupervisedStack, [1, 2, 3] }
    ]
    opts = [strategy: :one_for_one, name: SupervisedStack.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
