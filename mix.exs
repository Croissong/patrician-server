defmodule PatricianServer.Mixfile do
  use Mix.Project

  def project do
    [app: :patrician_server,
     version: "0.0.1",
     elixir: "~> 1.4",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {PatricianServer.Application, []},
     extra_applications: [:amqp, :logger, :runtime_tools]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:absinthe, github: "absinthe-graphql/absinthe", override: true},
      {:absinthe_phoenix, github: "absinthe-graphql/absinthe_phoenix", override: true},
      {:absinthe_plug, github: "absinthe-graphql/absinthe_plug", override: true},
      {:amqp, "~> 1.0.0-pre.1"},
      {:phoenix, "~> 1.3.0"},
      {:phoenix_pubsub, "~> 1.0.2"},
      {:phoenix_ecto, "~> 3.2.3"},
      {:postgrex, "~> 0.13.3"},
      {:cowboy, "~> 1.1.2"},
      {:credo, "~> 0.8.4", only: [:dev, :test], runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
