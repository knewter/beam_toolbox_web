# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, BeamToolboxWeb.Router,
  port: System.get_env("PORT"),
  ssl: false,
  code_reload: false,
  static_assets: true,
  cookies: true,
  session_key: "_beam_toolbox_web_key",
  session_secret: "@TFCIFT_#V0ZN_^X)&UD1!3D_FFI8CH1E#0=12_!6&P4JWFY1S3VXX18F$TM0H(1NQH%I"

config :phoenix, :logger,
  level: :error


# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
