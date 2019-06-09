defmodule TangosourceLibraryProject.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :author, :string
      add :isbn, :string
      add :edition, :integer
      add :published_at, :date
      add :summary, :text
      add :tags, :string
      add :cover, :string

      timestamps()
    end
  end
end
