defmodule Jfood.Catalog do
  alias Jfood.Catalog.Product
  alias Jfood.Repo


  def list_products do
    Product
    |> Repo.all
  end
  # def list_products do
  #   product1 = %Product{ name: "Tomato", price: 50, is_seasonal: false, category: "vegetables" }
  #   product2 = %Product{ name: "Apple", price: 100, is_seasonal: true, category: "fruits" }
  #   product3 = %Product{ name: "Pimentão", price: 40, is_seasonal: false, category: "vegetables" }
  #   product4 = %Product{ name: "Abacate", price: 150, is_seasonal: true, category: "fruits" }
  #   [product1, product2, product3, product4]
  # end
  def list_seasonal_products do
    list_products()
    |> Enum.filter(fn(product) -> product.is_seasonal == true end)
  end

  def get_category_products(name) do
    list_products()
    |> Enum.filter(fn(product) -> product.category == name end)
  end
end
