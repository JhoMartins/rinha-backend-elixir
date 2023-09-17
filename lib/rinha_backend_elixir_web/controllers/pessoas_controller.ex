defmodule RinhaBackendElixirWeb.PessoasController do
  use RinhaBackendElixirWeb, :controller

  alias RinhaBackendElixir.{Pessoas, Redis}
  alias RinhaBackendElixir.Pessoas.SearchInput

  action_fallback RinhaBackendElixirWeb.FallbackController

  def index(conn, params) do
    case SearchInput.build(params) do
      {:ok, search_input} ->
        pessoas = Pessoas.search_pessoas(search_input.t)

        render(conn, :index, pessoas: pessoas)

      {:error, changeset} ->
        {:invalid, changeset}
    end
  end

  def create(conn, params) do
    with {:ok, pessoa} <- Pessoas.create_pessoa(params) do
      Redis.set(pessoa.id, pessoa)

      conn
      |> put_resp_header("Location", "/pessoas/" <> pessoa.id)
      |> send_resp(:created, "")
    end
  end

  def show(conn, %{"id" => id}) do
    json =
      with nil <- Redis.get!(id) do
        pessoa_json = id |> Pessoas.get_pessoa!() |> Jason.encode!()

        spawn(fn -> Redis.set(id, pessoa_json) end)

        pessoa_json
      end

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, json)
  end

  def count(conn, _params) do
    count = Pessoas.count_pessoas()

    send_resp(conn, :ok, "#{count}")
  end

  def validate_params(struct, params) do
    with %Ecto.Changeset{valid?: false} = changeset <- struct.build(params) do
      {:invalid, changeset}
    end
  end
end
