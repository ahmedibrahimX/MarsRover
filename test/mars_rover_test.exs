defmodule MarsRoverTest do
  use ExUnit.Case
  doctest MarsRover

  test "get_state should return current state" do
    {:ok, _} = MarsRover.start_link({9, 9, :N, "rover0"})
    {:ok, state} = MarsRover.get_state("rover0")
    assert state == {9, 9, :N}
  end
end
