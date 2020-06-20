defmodule JfoodApi.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :quantity, :integer
      add :price, :decimal
      add :imageUrl, :string
      add :description, :text

      timestamps()
    end

  end
end
