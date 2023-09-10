defmodule RinhaBackendElixirWeb.PessoasController do
  use RinhaBackendElixirWeb, :controller

  alias RinhaBackendElixir.Pessoas
  alias RinhaBackendElixir.Pessoas.SearchInput

  action_fallback RinhaBackendElixirWeb.FallbackController

  def index(conn, params) do
    with {:ok, search_input} <- SearchInput.build(params) do
      pessoas = Pessoas.search_pessoas(search_input.t)

      render(conn, :index, pessoas: pessoas)
    end
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

    render(conn, :show, pessoa: pessoa)
  end

  def count(conn, _params) do
    count = Pessoas.count_pessoas()

    send_resp(conn, :ok, "#{count}")
  end
end
