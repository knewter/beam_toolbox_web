defmodule Mix.Tasks.Categorize do
  use Mix.Task
  alias BeamToolboxData.Models.Project
  alias BeamToolboxData.Models.Category

  @shortdoc "A task for categorizing items in the BEAM Toolbox"

  @moduledoc """
  Running this task will present you with a randomized list of uncategorized
  projects to review and categorize.  You may either categorize them in place,
  skip them, or create a new category they should go in.
  """

  def run([]) do
    Application.ensure_all_started(:beam_toolbox_data)
    :random.seed(:erlang.now)
    Mix.shell.info "Let's get started categorizing!"
    categorize_random_project
  end

  def categorize_random_project do
    case get_random_uncategorized_project do
      nil -> Mix.shell.info "They're all categorized, bucko..."
      project -> categorize(project)
    end
  end

  defp categorize(project) do
    Mix.shell.info "There are still #{Enum.count(Project.for_category(:uncategorized))} uncategorized projects..."
    Mix.shell.info ""
    IO.ANSI.format([:green, "Time to categorize #{project.key}"]) |> Mix.shell.info
    categories = Category.all
    choice = prompt_for_categorization(categories, project)
    handle_choice(choice, categories, project)
  end

  def handle_choice("q", _, _) do
    IO.ANSI.format([:green, :bright, "Thanks for trying! :)"]) |> Mix.shell.info
  end
  def handle_choice("s", _, _) do
    categorize_random_project
  end
  def handle_choice(choice, categories, project) do
    {index, _} = Integer.parse(choice)
    category = Enum.at(categories, index)
    Project.categorize(project, category)
    categorize_random_project
  end

  def prompt_for_categorization(categories, project) do
    Mix.shell.info "Here's its description:"
    Mix.shell.info ""
    Mix.shell.info Project.description(project)
    Mix.shell.info ""
    Mix.shell.info "Where should it go?"
    for {category, index} <- Enum.with_index(categories) do
      Mix.shell.info "  [#{index}] #{category.name}"
    end
    Mix.shell.info "  [q] I'm done for now"
    Mix.shell.info "  [s] Skip it"
    choice = Mix.shell.prompt "Choose: "
    String.replace(choice, "\n", "")
  end

  defp get_random_uncategorized_project do
    projects = Project.for_category(:uncategorized)
    case Enum.count(projects) do
      0 -> nil
      count ->
        random = :random.uniform(count)
        Enum.at(projects, random)
    end
  end
end
