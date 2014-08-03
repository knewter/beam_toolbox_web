use Mix.Config

config :phoenix, BeamToolboxWeb.Router,
  port: System.get_env("PORT") || 4000,
  ssl: false,
  code_reload: true,
  cookies: true,
  consider_all_requests_local: true,
  session_key: "_beam_toolbox_web_key",
  session_secret: "@TFCIFT_#V0ZN_^X)&UD1!3D_FFI8CH1E#0=12_!6&P4JWFY1S3VXX18F$TM0H(1NQH%I"

config :phoenix, :logger,
  level: :debug


