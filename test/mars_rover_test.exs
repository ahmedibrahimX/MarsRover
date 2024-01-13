defmodule MarsRoverTest do
  use ExUnit.Case
  doctest MarsRover

  test "get_state should return current state" do
    {:ok, _} = MarsRover.start_link({9, 9, :N, "rover0"})
    {:ok, state} = MarsRover.get_state("rover0")
    assert state == {9, 9, :N}
  end

  test "handle_cast :go_forward in north direction should return updated state" do
    {:noreply, state} = MarsRover.handle_cast(:go_forward, %MarsRover{x: 1, y: 3, direction: :N})
    assert state.x == 1
    assert state.y == 4
    assert state.direction == :N
  end

  test "handle_cast :go_forward in south direction should return updated state" do
    {:noreply, state} = MarsRover.handle_cast(:go_forward, %MarsRover{x: 1, y: 3, direction: :S})
    assert state.x == 1
    assert state.y == 2
    assert state.direction == :S
  end

  test "handle_cast :go_forward in east direction should return updated state" do
    {:noreply, state} = MarsRover.handle_cast(:go_forward, %MarsRover{x: 1, y: 3, direction: :E})
    assert state.x == 2
    assert state.y == 3
    assert state.direction == :E
  end

  test "handle_cast :go_forward in west direction should return updated state" do
    {:noreply, state} = MarsRover.handle_cast(:go_forward, %MarsRover{x: 1, y: 3, direction: :W})
    assert state.x == 0
    assert state.y == 3
    assert state.direction == :W
  end

  test "handle_cast :go_backward in north direction should return updated state" do
    {:noreply, state} = MarsRover.handle_cast(:go_backward, %MarsRover{x: 1, y: 3, direction: :N})
    assert state.x == 1
    assert state.y == 2
    assert state.direction == :N
  end

  test "handle_cast :go_backward in south direction should return updated state" do
    {:noreply, state} = MarsRover.handle_cast(:go_backward, %MarsRover{x: 1, y: 3, direction: :S})
    assert state.x == 1
    assert state.y == 4
    assert state.direction == :S
  end

  test "handle_cast :go_backward in east direction should return updated state" do
    {:noreply, state} = MarsRover.handle_cast(:go_backward, %MarsRover{x: 1, y: 3, direction: :E})
    assert state.x == 0
    assert state.y == 3
    assert state.direction == :E
  end

  test "handle_cast :go_backward in west direction should return updated state" do
    {:noreply, state} = MarsRover.handle_cast(:go_backward, %MarsRover{x: 1, y: 3, direction: :W})
    assert state.x == 2
    assert state.y == 3
    assert state.direction == :W
  end

  test "handle_cast :rotate_left facing north should return updated state" do
    {:noreply, state} = MarsRover.handle_cast(:rotate_left, %MarsRover{x: 1, y: 3, direction: :N})
    assert state.x == 1
    assert state.y == 3
    assert state.direction == :W
  end

  test "handle_cast :rotate_left facing west should return updated state" do
    {:noreply, state} = MarsRover.handle_cast(:rotate_left, %MarsRover{x: 1, y: 3, direction: :W})
    assert state.x == 1
    assert state.y == 3
    assert state.direction == :S
  end

  test "handle_cast :rotate_left facing south should return updated state" do
    {:noreply, state} = MarsRover.handle_cast(:rotate_left, %MarsRover{x: 1, y: 3, direction: :S})
    assert state.x == 1
    assert state.y == 3
    assert state.direction == :E
  end

  test "handle_cast :rotate_left facing east should return updated state" do
    {:noreply, state} = MarsRover.handle_cast(:rotate_left, %MarsRover{x: 1, y: 3, direction: :E})
    assert state.x == 1
    assert state.y == 3
    assert state.direction == :N
  end

  test "handle_cast :rotate_right facing north should return updated state" do
    {:noreply, state} = MarsRover.handle_cast(:rotate_right, %MarsRover{x: 1, y: 3, direction: :N})
    assert state.x == 1
    assert state.y == 3
    assert state.direction == :E
  end

  test "handle_cast :rotate_right facing west should return updated state" do
    {:noreply, state} = MarsRover.handle_cast(:rotate_right, %MarsRover{x: 1, y: 3, direction: :W})
    assert state.x == 1
    assert state.y == 3
    assert state.direction == :N
  end

  test "handle_cast :rotate_right facing south should return updated state" do
    {:noreply, state} = MarsRover.handle_cast(:rotate_right, %MarsRover{x: 1, y: 3, direction: :S})
    assert state.x == 1
    assert state.y == 3
    assert state.direction == :W
  end

  test "handle_cast :rotate_right facing east should return updated state" do
    {:noreply, state} = MarsRover.handle_cast(:rotate_right, %MarsRover{x: 1, y: 3, direction: :E})
    assert state.x == 1
    assert state.y == 3
    assert state.direction == :S
  end
end
