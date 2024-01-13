defmodule Controller do
  def send_command(name, :F) do
    MarsRover.go_forward(name)
  end

  def send_command(name, :B) do
    MarsRover.go_backward(name)
  end

  def send_command(name, :L) do
    MarsRover.rotate_left(name)
  end

  def send_command(name, :R) do
    MarsRover.rotate_right(name)
  end
end
