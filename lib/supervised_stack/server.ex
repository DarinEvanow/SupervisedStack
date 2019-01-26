defmodule SupervisedStack.Server do
  use GenServer
  alias SupervisedStack.Impl

  def init(initial_stack) do
    { :ok, initial_stack }
  end

  def handle_cast({:push, new_element}, current_stack) do
    { :noreply, Impl.push(current_stack, new_element) }
  end

  def handle_call(:pop, _from, current_stack) do
    [head | tail] = Impl.pop(current_stack)
    { :reply, head,  tail}
  end

  def format_status(_reason, [ _pdict, state ]) do
    [data: [{'State', "My current state is '#{inspect state}', and I'm happy"}]]
  end

  def terminate(reason, state) do
    IO.puts "Reason: #{inspect reason}"
    IO.puts "State:  #{inspect state}"
  end
end
