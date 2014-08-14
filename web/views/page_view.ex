defmodule BeamToolboxWeb.PageView do
  use BeamToolboxWeb.Views

  def category_link :uncategorized do
    projects_count = Project.for_category(:uncategorized) |> Enum.count
    render "category.html", %{category: %Category{slug: "uncategorized", name: "Uncategorized"}, count: projects_count}
  end
  def category_link category do
    projects_count = Project.for_category(category) |> Enum.count
    render "category.html", %{category: category, count: projects_count}
  end
end
