import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :saints_feed, SaintsFeed.Repo,
  username: "postgres",
  password: "postgres",
  database: "saints_feed_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :saints_feed, SaintsFeedWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "F+Usbr+bZZhj8b7WFTuFw/M2GY+L/u3PhMKXF1SBqatAdslyDbfPmo0Fmmw3xWkL",
  server: false

# In test we don't send emails.
config :saints_feed, SaintsFeed.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
