defmodule JfoodWeb.Api.CategoryView do
  use JfoodWeb, :view

  def title_case(name) do
    name
    |> String.downcase
    |> String.capitalize
  end

  def render("show.json", %{products: products}) do
    %{data: render_many(products, __MODULE__, "product.json", as: :product)}
  end

  def render("product.json", %{product: product}) do
    %{
      name: product.name,
      price: Decimal.to_float(product.price),
      is_seasonal: product.is_seasonal,
      category: product.category
    }
  end
end
