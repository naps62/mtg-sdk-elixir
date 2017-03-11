defmodule MTG.Mixfile do
  use Mix.Project

  @description "Magic the Gathering API Wrapper"
  @github_url "https://github.com/naps62/mtg-sdk-elixir"


  def project do
    [
      app: :mtg_api,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: @description,
      source_url: @github_url,
      package: package(),
    ]
  end

  def application do
    [extra_applications: [:logger, :httpoison],
     mod: {MTG, []}]
  end

  defp deps do
    [
      {:httpoison, "~> 0.10.0"},
      {:poison, "~> 3.0"},
      {:credo, "~> 0.5", only: [:dev, :test]},
      {:ex_doc, ">= 0.0.0", only: :dev},
    ]
  end

  defp package do
    [
      package: :mtg_api,
      maintainers: ["Miguel Palhas"],
      licenses: ["MIT"],
      links: %{"Github" => @github_url}
    ]
  end
end
