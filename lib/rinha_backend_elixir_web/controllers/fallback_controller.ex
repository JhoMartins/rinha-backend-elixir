defmodule RinhaBackendElixirWeb.FallbackController do
  use RinhaBackendElixirWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: RinhaBackendElixirWeb.ChangesetJSON)
    |> render(:error, changeset: changeset)
  end
end
