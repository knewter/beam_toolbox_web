defmodule BeamToolboxWeb.PageController do
  use Phoenix.Controller
  alias BeamToolboxData.Models.Project
  alias BeamToolboxData.Models.Category

  def index(conn, _params) do
    projects = Project.for_category(:uncategorized)
    categories = Category.all
    render conn, "index", %{projects: projects, categories: categories}
  end
end
