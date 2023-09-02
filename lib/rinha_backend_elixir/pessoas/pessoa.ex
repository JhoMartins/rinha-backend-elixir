defmodule RinhaBackendElixir.Pessoas.Pessoa do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pessoas" do
    field :stack, :string
    field :nome, :string
    field :apelido, :string
    field :nascimento, :string

    timestamps()
  end

  @doc false
  def changeset(pessoa, attrs) do
    pessoa
    |> cast(attrs, [:nome, :apelido, :nascimento, :stack])
    |> validate_required([:nome, :apelido, :nascimento, :stack])
  end
end
