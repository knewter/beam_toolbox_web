defmodule BeamToolboxWeb.Views do

  defmacro __using__(_options) do
    quote do
      use Phoenix.View
      alias BeamToolboxWeb.Router
      alias BeamToolboxData.Models.Project
      alias BeamToolboxData.Models.Category
      import unquote(__MODULE__)

      # This block is expanded within all views for aliases, imports, etc
      import BeamToolboxWeb.I18n
    end
  end

  # Functions defined here are available to all other views/templates
end


