defmodule RinhaBackendElixirWeb.PessoasController do
  use RinhaBackendElixirWeb, :controller

  alias RinhaBackendElixir.Pessoas

  action_fallback RinhaBackendElixirWeb.FallbackController

  def index(conn, _params) do
    pessoas = Pessoas.list_pessoas()

    json(conn, pessoas)
  end

  def create(conn, %{"stack" => stack} = params) do
    params = Map.put(params, "stack_array", stack)

    with {:ok, pessoa} <- Pessoas.create_pessoa(params) do
      conn
      |> put_resp_header("Location", "/pessoas/" <> pessoa.id)
      |> send_resp(:created, "")
    end
  end

  def show(conn, %{"id" => id}) do
    pessoa = Pessoas.get_pessoa!(id)

    json(conn, pessoa)
  end

  def count(conn, _params) do
    count = Pessoas.count_pessoas()

    send_resp(conn, :ok, "#{count}")
  end
end
