defmodule LangchainEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :langchainex,
      version: "0.2.3",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      package: package(),
      # prevents protocol consolidation warning
      consolidate_protocols: Mix.env() != :test
    ]
  end

  def application do
    [
      extra_applications: [:logger, :telemetry]
    ]
  end

  defp deps do
    [
      # bumblebee is optional, if you want to run models locally
      {:bumblebee, github: "elixir-nx/bumblebee", optional: true},
      # if you want to run bumblbee models on your GPU (*highly* recommended)
      # you can uncomment exla and it *should* be able to build
      # though this can get tricky on non-linux platforms
      # {:exla, "~> 0.5.1"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:elixir_uuid, "~> 1.2"},
      {:ex_doc, "~> 0.31", only: :dev, runtime: false},
      # kino is optional, use if you want to use ui with models
      # {:kino, "~> 0.8.0", optional: true}
      {:ex_openai, "~> 1.5"},
      {:jason, "~> 1.4"},
      # telemetry is optional, use if you want to run models locally with bumblebee
      {:telemetry, "~> 1.2", optional: true},
      {:ssl_verify_fun, "~> 1.1", manager: :rebar3, override: true}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
        "homepage" => "https://github.com/orthagonal/langchainex",
        "repository" => "https://github.com/orthagonal/langchainex.git",
        "docs" => "https://hexdocs.pm/langchainex"
      },
      description: "Language Chains for Elixir"
    ]
  end

  defp aliases do
    [
      verify: ["compile --warnings-as-errors", "format --check-formatted", "credo --strict"]
    ]
  end
end
