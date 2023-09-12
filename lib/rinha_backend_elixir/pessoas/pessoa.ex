defmodule RinhaBackendElixir.Pessoas.Pessoa do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "pessoas" do
    field :stack, :string
    field :nome, :string
    field :apelido, :string
    field :nascimento, :string
    field :stack_array, {:array, :string}, virtual: true

    timestamps()
  end

  @doc false
  def changeset(pessoa, attrs) do
    pessoa
    |> cast(attrs, [:stack_array, :nome, :apelido, :nascimento])
    |> validate_required([:nome, :apelido, :nascimento])
    |> validate_length(:nome, max: 100)
    |> validate_length(:apelido, max: 32)
    |> validate_change(:nascimento, &validate_date_format/2)
    |> validate_change(:stack_array, &validate_stack/2)
    |> put_change(:stack, stack_to_string(attrs["stack"]))
    |> unique_constraint(:apelido)
  end

  defp validate_date_format(field, value) do
    case Date.from_iso8601(value) do
      {:ok, _date} -> []
      {:error, reason} -> ["#{field}": to_string(reason)]
    end
  end

  defp validate_stack(_field, stack) when is_list(stack) do
    is_valid_stack =
      Enum.all?(stack, fn stack ->
        is_binary(stack) && String.length(stack) <= 32
      end)

    if is_valid_stack, do: [], else: [stack: "invalid format"]
  end

  defp validate_stack(_, _), do: []

  defp stack_to_string(stack) when is_list(stack), do: Enum.join(stack, " ")
  defp stack_to_string(_), do: nil
end
