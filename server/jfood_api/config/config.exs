# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :jfood_api,
  ecto_repos: [JfoodApi.Repo]

# Configures the endpoint
config :jfood_api, JfoodApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5cOOhn32lQSyOOyqJO4cX9wzD+P7M+70OGp6C4YMJHiHQFs+DWBEUqYm8W5AM7OM",
  render_errors: [view: JfoodApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: JfoodApi.PubSub,
  live_view: [signing_salt: "nxt7fFok"]

# Pow configuration
  config :jfood_api, :pow,
  user: JfoodApi.Users.User,
  repo: JfoodApi.Repo

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
