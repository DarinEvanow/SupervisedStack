defmodule SupervisedStack do

  @server SupervisedStack.Server

  def start_link(current_number) do
    GenServer.start_link(@server, current_number, name: @server)
  end

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end

  def push(new_element) do
    GenServer.cast(@server, {:push, new_element})
  end

  def pop do
    GenServer.call(@server, :pop)
  end
end
