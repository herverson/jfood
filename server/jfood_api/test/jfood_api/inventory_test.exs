defmodule JfoodApi.InventoryTest do
  use JfoodApi.DataCase

  alias JfoodApi.Inventory

  describe "products" do
    alias JfoodApi.Inventory.Product

    @valid_attrs %{description: "some description", imageUrl: "some imageUrl", name: "some name", price: "120.5", quantity: 42}
    @update_attrs %{description: "some updated description", imageUrl: "some updated imageUrl", name: "some updated name", price: "456.7", quantity: 43}
    @invalid_attrs %{description: nil, imageUrl: nil, name: nil, price: nil, quantity: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Inventory.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Inventory.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Inventory.create_product(@valid_attrs)
      assert product.description == "some description"
      assert product.imageUrl == "some imageUrl"
      assert product.name == "some name"
      assert product.price == Decimal.new("120.5")
      assert product.quantity == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Inventory.update_product(product, @update_attrs)
      assert product.description == "some updated description"
      assert product.imageUrl == "some updated imageUrl"
      assert product.name == "some updated name"
      assert product.price == Decimal.new("456.7")
      assert product.quantity == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_product(product, @invalid_attrs)
      assert product == Inventory.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Inventory.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Inventory.change_product(product)
    end
  end
end
