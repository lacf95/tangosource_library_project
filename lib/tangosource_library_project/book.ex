defmodule TangosourceLibraryProject.Book do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset

  alias TangosourceLibraryProject.{Book, BookCoverUploader, Repo}

  schema "books" do
    field :title, :string
    field :author, :string
    field :isbn, :string
    field :edition, :integer
    field :published_at, :date
    field :summary, :string
    field :tags, :string
    field :cover, BookCoverUploader.Type

    timestamps()
  end

  @doc false
  def changeset(book, attrs \\ %{}) do
    book
    |> cast(attrs, [:title, :author, :isbn, :edition, :published_at, :summary, :tags])
    |> validate_required([:title, :author])
    |> validate_number(:edition, greater_than: 0)
  end

  @doc false
  def cover_changeset(book, attrs \\ %{}) do
    book
    |> cast_attachments(attrs, [:cover])
  end

  def create(attrs) do
    Repo.transaction(fn ->
      with {:ok, book } <- %Book{} |> Book.changeset(attrs) |> Repo.insert(),
           {:ok, book } <- book |> Book.cover_changeset(attrs) |> Repo.update()
      do
        book
      else
        {:error, changeset} ->
          Repo.rollback(changeset)
          changeset
      end
    end)
  end

  def update(book, attrs) do
    Repo.transaction(fn ->
      with {:ok, book } <- book |> Book.changeset(attrs) |> Repo.update(),
           {:ok, book } <- book |> Book.cover_changeset(attrs) |> Repo.update()
      do
        book
      else
        {:error, changeset} ->
          Repo.rollback(changeset)
          changeset
      end
    end)
  end

  def delete(book) do
    book
    |> Repo.delete()
  end

  def find!(id), do: Book |> Repo.get!(id)

  def new_changeset(%Book{} = book), do: Book.changeset(book)

  def all, do: Repo.all(Book)

  def cover_url(book, version \\ :original) do
    BookCoverUploader.url({book.cover, book}, version)
  end
end
