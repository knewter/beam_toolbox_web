defmodule BeamToolboxWeb.CategoryPrimer do
  alias BeamToolboxData.Models.Category

  @categories [
    ["integration-testing", "Integration Testing"],
    ["general-testing", "General Testing"]
  ]

  def run do
    @categories
    |> Enum.map &find_or_create/1
  end

  defp find_or_create [slug, name] do
    Category.create(name, slug)
  end
end
