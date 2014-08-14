defmodule BeamToolboxWeb.CategoryController do
  use Phoenix.Controller
  alias BeamToolboxData.Models.Project
  alias BeamToolboxData.Models.Category

  def show(conn, %{"id" => "uncategorized"}) do
    projects = Project.for_category(:uncategorized) |> Enum.sort(&(&1.key <= &2.key))
    render conn, "show", %{category: %Category{slug: "uncategorized", name: "Uncategorized"}, projects: projects}
  end
  def show(conn, %{"id" => slug}) do
    category = Category.find_by_slug(slug)
    projects = Project.for_category(category) |> Enum.sort(&(&1.key <= &2.key))
    render conn, "show", %{category: category, projects: projects}
  end
end
