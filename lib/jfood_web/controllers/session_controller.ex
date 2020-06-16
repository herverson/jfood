defmodule JfoodWeb.SessionController do
  use JfoodWeb, :controller
  alias Jfood.CRM
  def create(conn, %{"session" => session_params}) do
    case CRM.get_customer_by_credentials(session_params) do
      :error ->
        conn
        |> put_flash(:error, "username/password inválidos!")
        |> render("new.html")
      customer ->
        conn
        |> assign(:current_customer, customer)
        |> put_session(:customer_id, customer.id)
        |> configure_session(renew: true)
        |> put_flash(:info, "Login realizado com sucesso!")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end
  def new(conn, _params) do
    render(conn, "new.html")
  end

  def delete(conn, _) do
    clear_session(conn)
    |> put_flash(:info, "Deslogado")
    |> redirect(to: Routes.page_path(conn, :index))
   end
end
