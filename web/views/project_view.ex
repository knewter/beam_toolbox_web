defmodule BeamToolboxWeb.ProjectView do
  use BeamToolboxWeb.Views
  alias BeamToolboxData.Models.Project

  def hex_package_link(project) do
    "<a href='https://hex.pm/packages/#{project.key}'>View this project on hex</a>"
  end

  def source_link(project) do
    link_if_exists(Project.source_link(project), "Source")
  end

  def link_if_exists(link, text) do
    case link do
      nil -> ""
      _ -> "<a href='#{link}'>#{text}</a>"
    end
  end

  def github_readme(project) do
    BeamToolboxData.Models.Project.GitHub.readme(project)
  end
end
