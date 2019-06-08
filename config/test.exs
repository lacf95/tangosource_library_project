use Mix.Config

# Configure your database
config :tangosource_library_project, TangosourceLibraryProject.Repo,
  username: "postgres",
  password: "postgres",
  database: "tangosource_library_project_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tangosource_library_project, TangosourceLibraryProjectWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
