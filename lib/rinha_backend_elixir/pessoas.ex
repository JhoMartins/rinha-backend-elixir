defmodule RinhaBackendElixir.Pessoas do
  @moduledoc """
  The Pessoas context.
  """

  import Ecto.Query, warn: false
  alias RinhaBackendElixir.Repo

  alias RinhaBackendElixir.Pessoas.{Pessoa, SearchInput}

  defdelegate build_search(attrs), to: SearchInput, as: :build
  defdelegate build_pessoa(attrs), to: Pessoa, as: :build

  def list_pessoas do
    Repo.all(Pessoa)
  end

  def search_pessoas(term) do
    from(p in Pessoa,
      where: ilike(p.searchable, ^"%#{term}%"),
      limit: 50
    )
    |> Repo.all()
  end

  def get_pessoa!(id), do: Repo.get!(Pessoa, id)

  def create_pessoa(attrs \\ %{}) do
    %Pessoa{}
    |> Pessoa.changeset(attrs)
    |> Repo.insert()
  end

  def bulk_insert(pessoas), do: Repo.insert_all(Pessoa, pessoas, on_conflict: :nothing)

  def insert_pessoa(pessoa), do: Repo.insert(pessoa, on_conflict: :nothing)

  def count_pessoas, do: Repo.aggregate(Pessoa, :count)
end
