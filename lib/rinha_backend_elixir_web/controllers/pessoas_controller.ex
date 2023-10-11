defmodule RinhaBackendElixirWeb.PessoasController do
  use RinhaBackendElixirWeb, :controller

  alias RinhaBackendElixir.{Pessoas, Redis}
  alias RinhaBackendElixir.Workers.BatchInsert

  action_fallback RinhaBackendElixirWeb.FallbackController

  def index(conn, params) do
    if params["t"] do
      send_resp(conn, 200, "")

    else
      send_resp(conn, 400, "")
    end
    # with {:ok, search} <- Pessoas.build_search(params) do
    #   pessoas = Pessoas.search_pessoas(search.t)

    #   json(conn, pessoas)
    # end
  end

  def create(conn, params) do
    conn
    |> put_resp_header("Location", "/pessoas/1")
    |> send_resp(:created, "")
    # params = Map.put(params, "id", Ecto.UUID.generate())

    # with {:ok, pessoa} <- Pessoas.build_pessoa(params) do
    #   case Redis.get!(pessoa.apelido) do
    #     nil ->
    #       warmup_cache(pessoa)

    #       BatchInsert.enqueue(pessoa)

    #       conn
    #       |> put_resp_header("Location", "/pessoas/" <> pessoa.id)
    #       |> send_resp(:created, "")

    #     _pessoa ->
    #       send_resp(conn, :unprocessable_entity, "")
    #   end
    # end
  end

  def show(conn, %{"id" => id}) do
    # json =
    #   with nil <- Redis.get!(id) do
    #     pessoa_json = id |> Pessoas.get_pessoa!() |> Jason.encode!()

    #     spawn(fn -> Redis.set(id, pessoa_json) end)

    #     pessoa_json
    #   end

    send_resp(conn, 200, "")
  end

  def count(conn, _params) do
    count = Pessoas.count_pessoas()

    send_resp(conn, :ok, "#{count}")
  end

  defp warmup_cache(pessoa) do
    Redis.set(pessoa.id, pessoa)
    Redis.set(pessoa.apelido, pessoa)
  end
end
