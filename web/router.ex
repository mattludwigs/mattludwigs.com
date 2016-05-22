defmodule Wigs.Router do
  use Wigs.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admin_layout do
    plug :put_layout, {Wigs.LayoutView, :admin}
  end

  scope "/", Wigs do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", PageController, :about

    get "/posts", PostController, :index
  end

  scope "/admin", Wigs do
    pipe_through [:browser, :admin_layout]
    get "/", AdminController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Wigs do
  #   pipe_through :api
  # end
end
