defmodule JfoodWeb.Router do
  use JfoodWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug JfoodWeb.Plugs.LoadCustomer
    plug JfoodWeb.Plugs.FetchCart

  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JfoodWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/categories/:name", CategoryController, :show
    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete
    post "/cart", CartController, :add
    get "/cart", CartController, :show
    put "/cart", CartController, :update

  end

  # Other scopes may use custom stacks.
  scope "/api", JfoodWeb.Api, as: :api do
    pipe_through :api
    get "/categories/:name", CategoryController, :show
    get "/cart", CartController, :show
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: JfoodWeb.Telemetry
    end
  end
end
