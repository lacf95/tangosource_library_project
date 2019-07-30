use Mix.Config

# Configure your database
config :tangosource_library_project, TangosourceLibraryProject.Repo,
  username: "postgres",
  password: "",
  database: "tangosource_library_project_test",
  hostname: "db",
  show_sensitive_data_on_connection_error: true,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tangosource_library_project, TangosourceLibraryProjectWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
