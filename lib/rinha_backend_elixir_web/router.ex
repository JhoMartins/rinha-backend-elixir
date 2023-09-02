defmodule RinhaBackendElixirWeb.Router do
  use RinhaBackendElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/pessoas", RinhaBackendElixirWeb do
    pipe_through :api

    resources "/", PessoasController, only: [:index, :show, :create]
    get "/contagem-pessoas", PessoasController, :count
  end
end
