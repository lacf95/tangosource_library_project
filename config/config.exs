# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tangosource_library_project,
  ecto_repos: [TangosourceLibraryProject.Repo]

# Configures the endpoint
config :tangosource_library_project, TangosourceLibraryProjectWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rskfnOQ/TEj36SGkZ+CF69kcL1Db7li0LbEpYYJuuOZ0o+3mVdY3znxfa82/5JCm",
  render_errors: [view: TangosourceLibraryProjectWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TangosourceLibraryProject.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :arc, storage: Arc.Storage.Local

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
