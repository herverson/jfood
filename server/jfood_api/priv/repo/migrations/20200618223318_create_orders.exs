defmodule JfoodApi.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :status, :string
      add :total, :decimal
      add :products, {:array, :map}
      add :user_id, :integer

      timestamps()
    end

  end
end
