defmodule JfoodApi.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :products, {:array, :map}
    field :status, :string
    field :total, :decimal
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:status, :total, :products, :user_id])
    |> validate_required([:status, :total, :products, :user_id])
  end
end
