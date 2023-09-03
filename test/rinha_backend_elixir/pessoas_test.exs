defmodule RinhaBackendElixir.PessoasTest do
  use RinhaBackendElixir.DataCase

  alias RinhaBackendElixir.Pessoas

  describe "pessoas" do
    alias RinhaBackendElixir.Pessoas.Pessoa

    import RinhaBackendElixir.PessoasFixtures

    @invalid_attrs %{stack: nil, nome: nil, apelido: nil, nascimento: nil}

    test "list_pessoas/0 returns all pessoas" do
      pessoa = pessoa_fixture()
      assert Pessoas.list_pessoas() == [pessoa]
    end

    test "get_pessoa!/1 returns the pessoa with given id" do
      pessoa = pessoa_fixture()
      assert Pessoas.get_pessoa!(pessoa.id) == pessoa
    end

    test "create_pessoa/1 with valid data creates a pessoa" do
      valid_attrs = %{
        stack: "some stack",
        nome: "some nome",
        apelido: "some apelido",
        nascimento: "some nascimento"
      }

      assert {:ok, %Pessoa{} = pessoa} = Pessoas.create_pessoa(valid_attrs)
      assert pessoa.stack == "some stack"
      assert pessoa.nome == "some nome"
      assert pessoa.apelido == "some apelido"
      assert pessoa.nascimento == "some nascimento"
    end

    test "create_pessoa/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pessoas.create_pessoa(@invalid_attrs)
    end

    test "update_pessoa/2 with valid data updates the pessoa" do
      pessoa = pessoa_fixture()

      update_attrs = %{
        stack: "some updated stack",
        nome: "some updated nome",
        apelido: "some updated apelido",
        nascimento: "some updated nascimento"
      }

      assert {:ok, %Pessoa{} = pessoa} = Pessoas.update_pessoa(pessoa, update_attrs)
      assert pessoa.stack == "some updated stack"
      assert pessoa.nome == "some updated nome"
      assert pessoa.apelido == "some updated apelido"
      assert pessoa.nascimento == "some updated nascimento"
    end

    test "update_pessoa/2 with invalid data returns error changeset" do
      pessoa = pessoa_fixture()
      assert {:error, %Ecto.Changeset{}} = Pessoas.update_pessoa(pessoa, @invalid_attrs)
      assert pessoa == Pessoas.get_pessoa!(pessoa.id)
    end

    test "delete_pessoa/1 deletes the pessoa" do
      pessoa = pessoa_fixture()
      assert {:ok, %Pessoa{}} = Pessoas.delete_pessoa(pessoa)
      assert_raise Ecto.NoResultsError, fn -> Pessoas.get_pessoa!(pessoa.id) end
    end

    test "change_pessoa/1 returns a pessoa changeset" do
      pessoa = pessoa_fixture()
      assert %Ecto.Changeset{} = Pessoas.change_pessoa(pessoa)
    end
  end
end
