defmodule JfoodApiWeb.ProductView do
  use JfoodApiWeb, :view
  alias JfoodApiWeb.ProductView

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{id: product.id,
      name: product.name,
      quantity: product.quantity,
      price: product.price,
      imageUrl: product.imageUrl,
      description: product.description}
  end
end
