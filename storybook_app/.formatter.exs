[
  import_deps: [:phoenix, :phoenix_storybook],
  plugins: [Phoenix.LiveView.HTMLFormatter],
  inputs: [
    "*.{heex,ex,exs}",
    "{config,lib,test}/**/*.{heex,ex,exs}",
    "../storybook/**/*.exs"
  ]
]
