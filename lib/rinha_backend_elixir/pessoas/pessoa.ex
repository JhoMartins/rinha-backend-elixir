defmodule RinhaBackendElixir.Pessoas.Pessoa do
  use Ecto.Schema
  import Ecto.Changeset

  alias RinhaBackendElixir.Ecto.Types.ListToString

  @primary_key {:id, Ecto.UUID, autogenerate: false}
  @derive {Jason.Encoder, only: [:id, :stack, :nome, :apelido, :nascimento]}

  schema "pessoas" do
    field :stack, ListToString
    field :nome, :string
    field :apelido, :string
    field :nascimento, :string
  end

  @doc false
  def changeset(pessoa, attrs) do
    pessoa
    |> cast(attrs, [:id, :stack, :nome, :apelido, :nascimento])
    |> validate_required([:nome, :apelido, :nascimento])
    |> validate_length(:nome, max: 100)
    |> validate_length(:apelido, max: 32)
    |> validate_change(:nascimento, &validate_date_format/2)
    |> validate_change(:stack, &validate_stack/2)
  end

  def build(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
    |> apply_action(:insert)
  end

  defp validate_date_format(field, value) do
    case Date.from_iso8601(value) do
      {:ok, _date} -> []
      {:error, reason} -> ["#{field}": to_string(reason)]
    end
  end

  defp validate_stack(_field, stack) do
    is_valid_stack = Enum.all?(stack, &(String.length(&1) <= 32))

    if is_valid_stack, do: [], else: [stack: "invalid format"]
  end
end
