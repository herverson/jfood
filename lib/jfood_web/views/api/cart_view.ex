defmodule JfoodWeb.Api.CartView do
  use JfoodWeb, :view
  alias Jfood.Sales.Order

  def cart_count(%Plug.Conn{} = conn) do
    cart_count(conn.assigns.cart)
  end

  def cart_count(%Order{} = cart) do
    Enum.reduce(cart.line_items, 0, fn(item, acc) ->
      acc + item.quantity
    end)
  end
  def render("show.json", %{cart: cart}) do
    %{data: render_many(cart, __MODULE__, "product.json", as: :cart)}
  end

  def render("product.json", %{cart: cart}) do
    %{
      line_items: cart.line_items
    }
  end

end
