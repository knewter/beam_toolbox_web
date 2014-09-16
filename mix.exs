defmodule BeamToolboxWeb.Mixfile do
  use Mix.Project

  def project do
    [ app: :beam_toolbox_web,
      version: "0.0.1",
      elixirc_paths: ["lib", "web"],
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      mod: { BeamToolboxWeb, [] },
      applications: [:phoenix, :beam_toolbox_data]
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:phoenix, "~> 0.4.1"},
      {:beam_toolbox_data, github: "knewter/beam_toolbox_data", env: Mix.env},
      {:cadfaerl,   github: "ddossot/cadfaerl"}
    ]
  end
end
