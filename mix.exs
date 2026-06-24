defmodule DaisyComponents.MixProject do
  use Mix.Project

  @source_url "https://github.com/evilmarty/daisy_components"

  def project do
    [
      app: :daisy_components,
      description: "Daisy UI components built with Phoenix LiveView.",
      source_url: @source_url,
      version: "0.1.2",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps()
    ]
  end

  defp package do
    [
      maintainers: ["Marty Zalega"],
      licenses: ["MIT"],
      files: ~w(lib .formatter.exs mix.exs README.md LICENSE),
      links: %{"GitHub" => @source_url}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix_live_view, "~> 1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
