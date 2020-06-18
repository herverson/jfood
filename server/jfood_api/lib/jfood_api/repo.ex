defmodule JfoodApi.Repo do
  use Ecto.Repo,
    otp_app: :jfood_api,
    adapter: Ecto.Adapters.Postgres
end
