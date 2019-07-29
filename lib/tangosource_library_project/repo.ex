defmodule TangosourceLibraryProject.Repo do
  use Ecto.Repo,
    otp_app: :tangosource_library_project,
    adapter: Ecto.Adapters.Postgres
  use Scrivener, page_size: 20
end
