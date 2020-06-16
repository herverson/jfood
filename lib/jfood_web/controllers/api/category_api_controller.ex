defmodule JfoodWeb.Api.CategoryController do
  use JfoodWeb, :controller
  alias Jfood.Catalog

  def show(conn, %{"name" => name}) do
    products = Catalog.get_category_products(name)
    conn
    |> assign(:products, products)
    |> assign(:name, name)
    |> render("show.json")
  end

end
