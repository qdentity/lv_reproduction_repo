defmodule LvDemoWeb.Router do
  use LvDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LvDemoWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LvDemoWeb do
    pipe_through :browser

    get "/", PageController, :index

    live "/demo", DemoLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", LvDemoWeb do
  #   pipe_through :api
  # end
end
