use Mix.Config

# General application configuration
config :patrician_server,
  ecto_repos: [PatricianServer.Repo]

# Configures the endpoint
config :patrician_server, PatricianServer.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8ijiJ+EacANI3zceh22sRHV6BFrCag1uuTBNgKmB33crRwjKqx5fZvTw0sgVS37D",
  render_errors: [view: PatricianServer.Web.ErrorView, accepts: ~w(json)],
  pubsub: [name: PatricianServer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
