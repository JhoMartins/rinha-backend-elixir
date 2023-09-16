defmodule RinhaBackendElixir.Redis do
  @moduledoc """
  Implementation of redis Cache at top of Redix lib
  """
  def set(key, value) when is_map(value),
    do: Redix.command(:redix, ["SET", key, Jason.encode!(value)])

  def set(key, value) when is_binary(value),
    do: Redix.command(:redix, ["SET", key, value])

  def get!(key) do
    {:ok, value} = Redix.command(:redix, ["GET", key])

    value
  end
end
