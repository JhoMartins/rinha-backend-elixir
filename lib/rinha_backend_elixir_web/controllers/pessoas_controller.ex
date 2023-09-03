defmodule RinhaBackendElixirWeb.PessoasController do
  use RinhaBackendElixirWeb, :controller

  alias RinhaBackendElixir.Pessoas

  action_fallback RinhaBackendElixirWeb.FallbackController

  def create(conn, params) do
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
end
