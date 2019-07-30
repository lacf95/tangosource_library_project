defmodule TangosourceLibraryProject.BookTest do
  use TangosourceLibraryProject.DataCase

  import TangosourceLibraryProject.BookFixtures

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
  @valid_cover_attrs %{
    cover: %Plug.Upload{
      content_type: "image/jpeg",
      filename: "book_cover.jpg",
      path: "test/fixtures/files/book_cover.jpg"
    }
  }
  @invalid_cover_attrs %{
    cover: %Plug.Upload{
      content_type: "text/plain",
      filename: "invalid_book_cover.file",
      path: "test/fixtures/files/invalid_book_cover.file"
    }
  }

  test "changeset with valid attrs" do
    changeset = Book.changeset(%Book{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with no title" do
    attrs = @valid_attrs |> Map.put(:title, nil)
    changeset = Book.changeset(%Book{}, attrs)
    refute changeset.valid?
  end

  test "changeset with no author" do
    attrs = @valid_attrs |> Map.put(:author, nil)
    changeset = Book.changeset(%Book{}, attrs)
    refute changeset.valid?
  end

  test "changeset with invalid edition" do
    attrs = @valid_attrs |> Map.put(:edition, 0)
    changeset = Book.changeset(%Book{}, attrs)
    refute changeset.valid?
  end

  test "book is created with valid cover" do
    attrs = @valid_attrs |> Map.merge(@valid_cover_attrs)
    assert {:ok, %Book{}} = Book.create(attrs)
  end

  test "book is created with invalid cover" do
    attrs = @valid_attrs |> Map.merge(@invalid_cover_attrs)
    assert {:error, changeset} = Book.create(attrs)
  end

  test "book is updated with valid attrs" do
    book = fixture(:book)
    attrs = @valid_attrs |> Map.put(:edition, 1)
    assert {:ok, %Book{}} = Book.update(book, attrs)
  end

  test "book is not updated with invalid author" do
    book = fixture(:book)
    attrs = @valid_attrs |> Map.put(:author, nil)
    assert {:error, changeset} = Book.update(book, attrs)
  end

  test "book is not updated with invalid title" do
    book = fixture(:book)
    attrs = @valid_attrs |> Map.put(:title, nil)
    assert {:error, changeset} = Book.update(book, attrs)
  end

  test "book is deleted" do
    book = fixture(:book)
    assert {:ok, book} = Book.delete(book)
  end

  test "book is found" do
    book = fixture(:book)
    found_book = Book.find!(book.id)
    assert book = found_book
  end
end
