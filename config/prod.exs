use Mix.Config

config :sage, Sage.Robot,
  adapter: Hedwig.Adapters.Slack,
  name: System.get_env("SLACK_BOT"),
  aka: System.get_env("SLACK_BOT_ALIAS"),
  token: System.get_env("SLACK_TOKEN")

config :hello, HelloWeb.Endpoint,
  load_from_system_env: true,
  url: [scheme: "https", host: "sage-bot.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE")

# Do not print debug messages in production
config :logger, level: :info

# Configure your database
config :hello, Hello.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true
