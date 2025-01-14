import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :sample_app, SampleApp.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "sample_app_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sample_app_web, SampleAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "4VDb9qshwqIMl1+q7NRJPyez2MOYStF852pZDijEGrxRMEPkkGS9zdO2LwO4LWqg",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# In test we don't send emails.
config :sample_app, SampleApp.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
