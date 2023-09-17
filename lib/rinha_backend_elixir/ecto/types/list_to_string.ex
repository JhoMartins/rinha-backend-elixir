defmodule RinhaBackendElixir.Ecto.Types.ListToString do
  use Ecto.Type
  def type, do: {:array, :string}

  def cast(value), do: Ecto.Type.cast(type(), value)

  def load(data), do: {:ok, String.split(data)}

  def dump(value), do: {:ok, Enum.join(value, " ")}
end
