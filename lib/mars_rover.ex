defmodule MarsRover do
  use GenServer
  @world_height 100
  @world_width 100

  defstruct [x: 0, y: 0, direction: :N, name: nil]

  def start_link({x, y, direction, name}) do
    GenServer.start_link(__MODULE__, {x, y, direction, name}, name: RegistryHelper.create_key(name))
  end

  def init({x, y, direction, name}) do
    {:ok, %MarsRover{x: x, y: y, direction: direction, name: name}}
  end

  def get_state(name) do
    name
      |> RegistryHelper.create_key
      |> GenServer.call(:get_state)
  end

  def handle_call(:get_state, _from, state) do
    %MarsRover{x: x, y: y, direction: d} = state
    {:reply, {:ok, {x, y, d}}, state}
  end

  def go_forward(name) do
    name
      |> RegistryHelper.create_key
      |> GenServer.cast(:go_forward)
  end

  def go_backward(name) do
    name
      |> RegistryHelper.create_key
      |> GenServer.cast(:go_backward)
  end

  def rotate_left(name) do
    name
      |> RegistryHelper.create_key
      |> GenServer.cast(:rotate_left)
  end

  def rotate_right(name) do
    name
      |> RegistryHelper.create_key
      |> GenServer.cast(:rotate_right)
  end

  def handle_cast(:go_forward, state) do
    new_state = case state.direction do
      :N -> %MarsRover{state | y: Integer.mod(state.y + 1, @world_height)}
      :S -> %MarsRover{state | y: Integer.mod(state.y - 1, @world_height)}
      :E -> %MarsRover{state | x: Integer.mod(state.x + 1, @world_width)}
      :W -> %MarsRover{state | x: Integer.mod(state.x - 1, @world_width)}
    end
    {:noreply, new_state}
  end

  def handle_cast(:go_backward, state) do
    new_state = case state.direction do
      :N -> %MarsRover{state | y: Integer.mod(state.y - 1, @world_height)}
      :S -> %MarsRover{state | y: Integer.mod(state.y + 1, @world_height)}
      :E -> %MarsRover{state | x: Integer.mod(state.x - 1, @world_width)}
      :W -> %MarsRover{state | x: Integer.mod(state.x + 1, @world_width)}
    end
    {:noreply, new_state}
  end

  def handle_cast(:rotate_left, state) do
    new_state = case state.direction do
      :N -> %MarsRover{state | direction: :W}
      :S -> %MarsRover{state | direction: :E}
      :E -> %MarsRover{state | direction: :N}
      :W -> %MarsRover{state | direction: :S}
    end
    {:noreply, new_state}
  end

  def handle_cast(:rotate_right, state) do
    new_state = case state.direction do
      :N -> %MarsRover{state | direction: :E}
      :S -> %MarsRover{state | direction: :W}
      :E -> %MarsRover{state | direction: :S}
      :W -> %MarsRover{state | direction: :N}
    end
    {:noreply, new_state}
  end
end
