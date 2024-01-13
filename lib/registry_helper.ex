defmodule RegistryHelper do
  def create_key(name), do: String.to_atom(name)

  def register(name), do: Registry.register(MarsRover.Registry, create_key(name), [])

  def get_pid(name) do
    [{pid, _}] = Registry.lookup(MarsRover.Registry, name)
    pid
  end
end
