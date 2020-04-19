# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_tailwind_turbolinks_skeleton,
  ecto_repos: [PhoenixTailwindTurbolinksSkeleton.Repo]

# Configures the endpoint
config :phoenix_tailwind_turbolinks_skeleton, PhoenixTailwindTurbolinksSkeletonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Z6+m6YdopIvPggYFpVefQZtPdTGg1RdtRfgJ8XwLHGpci4lQCyNU+yw0Iq8uOyHN",
  render_errors: [view: PhoenixTailwindTurbolinksSkeletonWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixTailwindTurbolinksSkeleton.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "yv2vdh60"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
