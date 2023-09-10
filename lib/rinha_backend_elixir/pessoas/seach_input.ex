defmodule RinhaBackendElixir.Pessoas.SearchInput do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  embedded_schema do
    field :t, :string
  end

  @doc false
  def changeset(search_input, attrs) do
    search_input
    |> cast(attrs, [:t])
    |> validate_required([:t])
  end

  def build(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
    |> apply_action(:insert)
  end
end
