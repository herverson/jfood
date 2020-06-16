defmodule JfoodWeb.CartController do
  use JfoodWeb, :controller
  alias Jfood.Sales

  @spec add(Plug.Conn.t(), map) :: Plug.Conn.t()
  def add(conn, %{"cart" => cart_params}) do
    cart = conn.assigns.cart
    case Sales.add_to_cart(cart, cart_params) do
      {:ok, _} ->
        %{"product_name" => name, "pack_size" => size, "quantity" => qty} = cart_params
        message = "Produto adicionado ao carrinho - #{name}(#{size}) x #{qty} quantidade"

        conn
        |> put_flash(:info, message)
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, _} ->
        conn
        |> put_flash(:info, "Erro ao adicionar produto ao carrinho")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def show(conn, _params) do
    cart = conn.assigns.cart
    cart_changeset = Sales.change_cart(cart)
    render conn, "show.html", cart: cart, cart_changeset: cart_changeset
  end

  def update(conn, %{"order" => cart_params}) do
    cart = conn.assigns.cart
    case Sales.update_cart(cart, cart_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Carrinho alterado com sucesso!")
        |> redirect(to: Routes.cart_path(conn, :show))
      {:error, _} ->
        conn
        |> put_flash(:info, "Erro ao alterar o carrinho!")
        |> redirect(to: Routes.cart_path(conn, :show))
    end
  end

end
