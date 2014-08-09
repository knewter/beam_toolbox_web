defmodule BeamToolboxWeb.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :beam_toolbox_web
  get "/", BeamToolboxWeb.PageController, :index, as: :page

  scope alias: BeamToolboxWeb do
    resources "projects", ProjectController
  end
end
