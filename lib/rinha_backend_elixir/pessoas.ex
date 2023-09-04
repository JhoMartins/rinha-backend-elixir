defmodule RinhaBackendElixir.Pessoas do
  @moduledoc """
  The Pessoas context.
  """

  import Ecto.Query, warn: false
  alias RinhaBackendElixir.Repo

  alias RinhaBackendElixir.Pessoas.Pessoa

  @doc """
  Returns the list of pessoas.

  ## Examples

      iex> list_pessoas()
      [%Pessoa{}, ...]

  """
  def list_pessoas do
    Repo.all(Pessoa)
  end

  @doc """
  Gets a single pessoa.

  Raises `Ecto.NoResultsError` if the Pessoa does not exist.

  ## Examples

      iex> get_pessoa!(123)
      %Pessoa{}

      iex> get_pessoa!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pessoa!(id), do: Repo.get!(Pessoa, id)

  @doc """
  Creates a pessoa.

  ## Examples

      iex> create_pessoa(%{field: value})
      {:ok, %Pessoa{}}

      iex> create_pessoa(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pessoa(attrs \\ %{}) do
    %Pessoa{}
    |> Pessoa.changeset(attrs)
    |> Repo.insert()
  end

  def count_pessoas, do: Repo.aggregate(Pessoa, :count)
end
