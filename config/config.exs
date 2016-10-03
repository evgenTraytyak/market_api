# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :market_api,
  ecto_repos: [MarketApi.Repo]

# Configures the endpoint
config :market_api, MarketApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ms++lnSN+CnoeF5xVP/6dZdldJ6IeXg8oNxFRMNEAZaN1o2nRGxnDhoFrtvMJ/zb",
  render_errors: [view: MarketApi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MarketApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :format_encoders,
  "json-api": Poison

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
