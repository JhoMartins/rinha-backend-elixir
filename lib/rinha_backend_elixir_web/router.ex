defmodule RinhaBackendElixirWeb.Router do
  use RinhaBackendElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RinhaBackendElixirWeb do
    pipe_through :api
  end
end
