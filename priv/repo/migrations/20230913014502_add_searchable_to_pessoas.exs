defmodule RinhaBackendElixir.Repo.Migrations.AddSearchableToPessoas do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION pg_trgm"

    execute "ALTER TABLE pessoas ADD COLUMN searchable TEXT GENERATED ALWAYS AS (LOWER(NOME || APELIDO || STACK)) STORED"

    execute "CREATE INDEX IF NOT EXISTS IDX_PESSOAS_SEARCHABLE ON pessoas USING GIST (searchable GIST_TRGM_OPS(SIGLEN=64));"
  end
end
