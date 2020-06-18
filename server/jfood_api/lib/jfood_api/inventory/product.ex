defmodule JfoodApi.Inventory.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :description, :string
    field :imageUrl, :string
    field :name, :string
    field :price, :decimal
    field :quantity, :integer

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :quantity, :price, :imageUrl, :description])
    |> validate_required([:name, :quantity, :price, :imageUrl, :description])
  end
end
