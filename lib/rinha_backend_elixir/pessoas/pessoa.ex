defmodule RinhaBackendElixir.Pessoas.Pessoa do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "pessoas" do
    field :stack, {:array, :string}
    field :nome, :string
    field :apelido, :string
    field :nascimento, :string

    timestamps()
  end

  @doc false
  def changeset(pessoa, attrs) do
    pessoa
    |> cast(attrs,[:stack, :nome, :apelido, :nascimento])
    |> validate_required([:nome, :apelido, :nascimento])
    |> validate_length(:nome, max: 100)
    |> validate_length(:nome, max: 32)
    |> validate_change(:nascimento, &validate_date_format/2)
  end

  defp validate_date_format(field, value) do
    case Date.from_iso8601(value) do
      {:ok, _date} -> []
      {:error, reason} -> ["#{field}": reason]
    end
  end
end