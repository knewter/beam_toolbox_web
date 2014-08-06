defmodule BeamToolboxWeb.PageController do
  use Phoenix.Controller
  alias BeamToolboxData.Models.Project
  alias BeamToolboxData.Repo

  def index(conn, _params) do
    projects = Project.for_category(:uncategorized)
    render conn, "index", %{projects: projects}
  end
end
