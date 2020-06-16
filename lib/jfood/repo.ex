defmodule Jfood.Repo do
  use Ecto.Repo,
    otp_app: :jfood,
    adapter: Ecto.Adapters.MyXQL
end
