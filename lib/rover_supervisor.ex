defmodule RoverSupervisor do
  use DynamicSupervisor

  def start_link(_), do: DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)

  def init(_), do: DynamicSupervisor.init(strategy: :one_for_one)

  def create_rover(name, x, y, direction), do: DynamicSupervisor.start_child(__MODULE__, {MarsRover, {x, y, direction, name}})

  def kill(rover) do
    pid = RegistryHelper.get_pid(rover.name)
    DynamicSupervisor.terminate_child(__MODULE__, pid)
  end

end
