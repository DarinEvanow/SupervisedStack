defmodule SupervisedStack.Impl do
  def push(current_stack, new_element) do
    [new_element | current_stack]
  end

  def pop([head | tail]) do
    [head | tail]
  end
end
