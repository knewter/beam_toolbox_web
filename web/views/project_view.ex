defmodule BeamToolboxWeb.ProjectView do
  use BeamToolboxWeb.Views

  def hex_package_link(project) do
    "<a href='https://hex.pm/packages/#{project.key}'>View this project on hex</a>"
  end
end
