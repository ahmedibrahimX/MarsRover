defmodule MarsRover do
  use GenServer

  defstruct [x: 0, y: 0, direction: :N, name: nil]

  def start_link({x, y, direction, name}) do
    GenServer.start_link(__MODULE__, {x, y, direction, name}, name: String.to_atom(name))
  end

  def init({x, y, direction, name}) do
    {:ok, %MarsRover{x: x, y: y, direction: direction, name: name}}
  end

  def get_state(name) do
    GenServer.call(String.to_atom(name), :get_state)
  end

  def handle_call(:get_state, _from, state) do
    %MarsRover{x: x, y: y, direction: d} = state
    {:reply, {:ok, {x, y, d}}, state}
  end
end
