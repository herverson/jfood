defmodule JfoodWeb.PageController do
  use JfoodWeb, :controller
  alias Jfood.Catalog

  def index(conn, _params) do
    seasonal_products = Catalog.list_seasonal_products
    conn
    |> assign(:seasonal_products, seasonal_products)
    |> render("index.html")
  end
end
