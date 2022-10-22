defmodule KVApiWeb.Router do
  use KVApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KVApiWeb do
    pipe_through :api
    get "/get", KVController, :get
    get "/put", KVController, :put
    post "/put", KVController, :put
  end
end
