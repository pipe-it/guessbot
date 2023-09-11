defmodule Guessbot.MixProject do
  use Mix.Project

  def project do
    [
      app: :guessbot,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      releases: releases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Guessbot.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_gram, "~> 0.8.0"},
      {:tesla, "~> 1.2"},
      {:hackney, "~> 1.12"},
      {:jason, ">= 1.0.0"},
      {:elixir_uuid, "~> 1.2"}
    ]
  end

  defp aliases do
    [
      release: ["release numguesbot_linux"]
    ]
  end

  defp releases() do
    [
      numguesbot_linux: [
        include_executables_for: [:unix],
        applications: [runtime_tools: :permanent],
        path: Path.absname("numguesbot_releases")
      ]
    ]
  end
end
