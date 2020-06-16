defmodule JfoodWeb.LayoutView do
  use JfoodWeb, :view
  import JfoodWeb.CartView, only: [cart_count: 1]
  def cart_link_text(conn) do
    raw """
    <i class="fa fa-shopping-cart"></i> <span class="cart-count">#{cart_count(conn)}</span>
    """
  end
end
