defmodule TangosourceLibraryProject.BookTest do
  use TangosourceLibraryProject.DataCase

  alias TangosourceLibraryProject.Book

  @valid_attributes %{
    title: "Learning the Bash Shell",
    author: "Cameron Newham & Bill Rosenblatt",
    isbn: "978-0596009656",
    edition: 3,
    summary: "# Learning the Bash Shell summary",
    published_at: ~D[2005-04-01],
    tags: "bash, shell, sh, zsh, command line, terminal"
  }
  @invalid_attributes %{
    title: nil,
    author: nil,
    isbn: "978-0596009656",
    edition: 0,
    summary: "# Learning the Bash Shell summary",
    published_at: ~D[2005-04-01],
    tags: "bash, shell, sh, zsh, command line, terminal"
  }
  @valid_cover_attributes %{
    cover: %Plug.Upload{
      content_type: "image/jpeg",
      filename: "book_cover.jpg",
      path: "test/fixtures/files/book_cover.jpg"
    }
  }
  @invalid_cover_attributes %{
    cover: %Plug.Upload{
      content_type: "text/plain",
      filename: "invalid_book_cover.file",
      path: "test/fixtures/files/invalid_book_cover.file"
    }
  }

  test "changeset with valid attributes" do
    changeset = Book.changeset(%Book{}, @valid_attributes)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Book.changeset(%Book{}, @invalid_attributes)
    refute changeset.valid?
  end

  test "book is created with valid cover" do
    attributes = @valid_attributes |> Map.merge(@valid_cover_attributes)
    assert {:ok, %Book{}} = Book.create(attributes)
  end

  test "book is created with invalid cover" do
    attributes = @valid_attributes |> Map.merge(@invalid_cover_attributes)
    assert {:error, changeset} = Book.create(attributes)
  end
end
