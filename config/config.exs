# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :upsert_bug,
  ecto_repos: [UpsertBug.Repo]

# Configures the endpoint
config :upsert_bug, UpsertBugWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jTgmUzx5wsoaknWPO5eSvZUgsXrwb1yq0k4GGTSpBpZjhdMJmb7wA1yftgy0dBDh",
  render_errors: [view: UpsertBugWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: UpsertBug.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
