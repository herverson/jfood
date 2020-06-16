defmodule Jfood.CRM do
  alias Jfood.Repo
  alias Jfood.CRM.Customer

  def build_customer(attrs \\ %{}) do
    %Customer{}
    |> Customer.changeset(attrs)
  end

  def create_customer(attrs) do
    attrs
    |> build_customer
    |> Repo.insert
  end

  def get_customer(id), do: Repo.get(Customer, id)

end
