defmodule RinhaBackendElixir.Repo.Migrations.CreatePessoas do
  use Ecto.Migration

  def change do
    create table(:pessoas, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :nome, :string, size: 100
      add :apelido, :string, size: 32
      add :nascimento, :string, size: 10
      add :stack, :string
    end

    create unique_index(:pessoas, :apelido)
  end
end
