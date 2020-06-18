defmodule JfoodApiWeb.Router do
  use JfoodApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug JfoodApiWeb.ApiAuthPlug, otp_app: :jfood_api
  end

  pipeline :api_protected do
    plug Pow.Plug.RequireAuthenticated, error_handler: JfoodApiWeb.ApiAuthErrorHandler
  end

  scope "/api", JfoodApiWeb do
    pipe_through :api

    resources "/registration", RegistrationController, singleton: true, only: [:create]
    resources "/session", SessionController, singleton: true, only: [:create, :delete]
    post "/session/renew", SessionController, :renew
  end

  scope "/api", JfoodApiWeb do
    pipe_through :api
    resources "/products", ProductController, only: [:show, :index]
    resources "/orders", OrderController, only: [:show, :index]
  end

  scope "/api", JfoodApiWeb do
    pipe_through [:api, :api_protected]
    resources "/products", ProductController, except: [:new, :edit, :show, :index]
    resources "/orders", OrderController, except: [:new, :edit, :show, :index]
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
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: JfoodApiWeb.Telemetry
    end
  end
end
