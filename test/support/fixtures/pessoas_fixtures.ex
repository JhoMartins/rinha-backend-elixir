defmodule RinhaBackendElixir.PessoasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RinhaBackendElixir.Pessoas` context.
  """

  @doc """
  Generate a pessoa.
  """
  def pessoa_fixture(attrs \\ %{}) do
    {:ok, pessoa} =
      attrs
      |> Enum.into(%{
        stack: "some stack",
        nome: "some nome",
        apelido: "some apelido",
        nascimento: "some nascimento"
      })
      |> RinhaBackendElixir.Pessoas.create_pessoa()

    pessoa
  end
end
