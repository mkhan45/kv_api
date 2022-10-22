import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :kv, KVApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ATerpu7HqYk2r5dGUuG5cewIUXR6nCj77gWh6ARPqpDl0GCiEXJh0EQ9dgDydJ4O",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
