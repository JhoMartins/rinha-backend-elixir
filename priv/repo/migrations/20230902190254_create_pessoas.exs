defmodule RinhaBackendElixir.Repo.Migrations.CreatePessoas do
  use Ecto.Migration

  def change do
    create table(:pessoas) do
      add :nome, :string, size: 100
      add :apelido, :string, size: 32
      add :nascimento, :string, size: 10
      add :stack, :string

      timestamps()
    end
  end
end
