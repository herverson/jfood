defmodule JfoodApiWeb.OrderView do
  use JfoodApiWeb, :view
  alias JfoodApiWeb.OrderView

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{
      id: order.id,
      status: order.status,
      total: order.total,
      user_id: order.user_id,
      products: render_many(order.products, OrderView, "product.json", as: :product),
    }
  end

  def render("product.json", %{product: product}) do
    %{
      product_id: product["product_id"],
      name: product["name"],
      quantity: product["quantity"],
      price: (product["price"]),
      total: product["total"],
    }
  end
end
