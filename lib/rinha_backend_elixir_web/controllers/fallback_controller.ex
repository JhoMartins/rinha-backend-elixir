defmodule RinhaBackendElixirWeb.FallbackController do
  use RinhaBackendElixirWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}),
    do: changeset_error(conn, changeset, :unprocessable_entity)

  def call(conn, {:invalid, %Ecto.Changeset{} = changeset}),
    do: changeset_error(conn, changeset, :bad_request)

  defp changeset_error(conn, changeset, status_code) do
    conn
    |> put_status(status_code)
    |> put_view(json: RinhaBackendElixirWeb.ChangesetJSON)
    |> render(:error, changeset: changeset)
  end
end
