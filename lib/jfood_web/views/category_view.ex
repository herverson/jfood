defmodule JfoodWeb.CategoryView do
  use JfoodWeb, :view

  def title_case(name) do
    name
    |> String.downcase
    |> String.capitalize
  end

end
