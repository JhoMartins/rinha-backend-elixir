defmodule RinhaBackendElixirWeb.PessoasController do
  use RinhaBackendElixirWeb, :controller

  alias RinhaBackendElixir.Pessoas
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

  def validate_params(struct, params) do
    with %Ecto.Changeset{valid?: false} = changeset <- struct.build(params) do
      {:invalid, changeset}
    end
  end
end
