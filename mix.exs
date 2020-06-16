defmodule Jfood.MixProject do
  use Mix.Project

  def project do
    [
      app: :jfood,
      version: "0.1.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Jfood.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5.3"},
      {:phoenix_ecto, "~> 4.1"},
      {:ecto_sql, "~> 3.4"},
      {:myxql, ">= 0.0.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_dashboard, "~> 0.2.0"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:hound, "~> 1.0"},
      {:nimble_csv, "~> 0.1.0"},
      {:decimal, "~> 1.6"},
      {:db_connection, "~> 2.0"},
      {:comeonin, "~> 5.3"},
      {:oauth2, "~> 2.0", override: true},
      {:ueberauth, "~> 0.6"},
      {:ueberauth_identity, "~> 0.2.3"},
      {:ueberauth_facebook, "~> 0.8"},
      {:ueberauth_github, "~> 0.7"},
      {:ueberauth_google, "~> 0.8"},
      {:ueberauth_slack, "~> 0.4"},
      {:ueberauth_twitter, "~> 0.3.0"},
      {:guardian, "~> 2.1.1"},
      # {:bcrypt_elixir, "~> 2.0"},
      # requried for Oauth2
      poison: "~> 3.1"
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup", "cmd npm install --prefix assets"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end
