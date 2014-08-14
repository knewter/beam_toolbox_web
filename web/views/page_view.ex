defmodule BeamToolboxWeb.PageView do
  use BeamToolboxWeb.Views

  def category_link :uncategorized do
    render "category.html", %{category: %Category{slug: "uncategorized", name: "Uncategorized"}}
  end
  def category_link category do
    render "category.html", %{category: category}
  end
end
