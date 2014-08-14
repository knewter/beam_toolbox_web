defmodule BeamToolboxWeb.PageController do
  use Phoenix.Controller
  alias BeamToolboxData.Models.Project
  alias BeamToolboxData.Models.Category

  def index(conn, _params) do
    categories = Category.all |> Enum.sort(&(&1.slug <= &2.slug))
    render conn, "index", %{categories: categories}
  end
end
