defmodule TangosourceLibraryProject.BookFixtures do
  alias TangosourceLibraryProject.Book

  @valid_attrs %{
    title: "Learning the Bash Shell",
    author: "Cameron Newham & Bill Rosenblatt",
    isbn: "978-0596009656",
    edition: 3,
    summary: "# Learning the Bash Shell summary",
    published_at: ~D[2005-04-01],
    tags: "bash, shell, sh, zsh, command line, terminal"
  }

  def fixture(:book, attrs \\ %{}) do
    book_attrs = @valid_attrs |> Map.merge(attrs)
    {:ok, book} = Book.create(book_attrs)
    book
  end
end
