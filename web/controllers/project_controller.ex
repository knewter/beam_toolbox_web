defmodule BeamToolboxWeb.ProjectController do
  use Phoenix.Controller
  alias BeamToolboxData.Models.Project

  def index(conn, _) do
    projects = Project.all |> Enum.sort(&(&1.key <= &2.key))
    render conn, "index", %{projects: projects}
  end

  def show(conn, %{"id" => key}) do
    project = Project.find_by_key(key)
    category_projects = other_projects_for_category(project)
    render conn, "show", %{project: project, category_projects: category_projects}
  end

  defp other_projects_for_category(project) do
    Project.for_category(Project.category(project))
    |> Enum.filter(fn(other) -> other != project end)
  end
end
