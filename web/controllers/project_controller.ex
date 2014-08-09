defmodule BeamToolboxWeb.ProjectController do
  use Phoenix.Controller
  alias BeamToolboxData.Models.Project

  def show(conn, %{"id" => key}) do
    project = Project.find_by_key(key)
    render conn, "show", %{project: project}
  end
end
