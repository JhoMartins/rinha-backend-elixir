defmodule RinhaBackendElixirWeb.PessoasController do
  use RinhaBackendElixirWeb, :controller

  alias RinhaBackendElixir.Pessoas

  def create(conn, params) do
    with {:ok, pessoa} <- Pessoas.create_pessoa(params) do
      conn
      |> put_resp_header("Localtion", "/pessoas/" <> pessoa.id)
      |> send_resp(:created, "")
    end
  end
end
