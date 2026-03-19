import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :storybook_app, StorybookAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "PHiHZCldLNPQ8Q9TvqcHORtCnydkGPIgILf4fHkm5dk8rla/4DKC43jj2EAPCmDL",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true

# Disable storybook in test to avoid asset resolution warnings.
config :phoenix_storybook, enabled: false
