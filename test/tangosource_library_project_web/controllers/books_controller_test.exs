defmodule TangosourceLibraryProjectWeb.BooksControllerTest do
  use TangosourceLibraryProjectWeb.ConnCase

  import TangosourceLibraryProject.BookFixtures

  test "GET /", %{conn: conn} do
    book = fixture(:book)
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "The TangoSource Library Project"
    assert html_response(conn, 200) =~ "Share a Book With Us"
    assert html_response(conn, 200) =~ book.title
  end

  test "GET /books", %{conn: conn} do
    book = fixture(:book)
    conn = get(conn, "/books")
    assert html_response(conn, 200) =~ "The TangoSource Library Project"
    assert html_response(conn, 200) =~ "Share a Book With Us"
    assert html_response(conn, 200) =~ book.title
  end

  test "GET /books/:id", %{conn: conn} do
    book = fixture(:book)
    conn = get(conn, "/books/#{book.id}")
    assert html_response(conn, 200) =~ book.title
    assert html_response(conn, 200) =~ "Edit This Book"
  end

  test "GET /books/:id/edit", %{conn: conn} do
    book = fixture(:book)
    conn = get(conn, "/books/#{book.id}/edit")
    assert html_response(conn, 200) =~ "Edit #{book.title}"
  end

  test "POST /books", %{conn: conn} do
    conn = post(conn, "/books", book: %{
      title: "Learning the Bash Shell",
      author: "Cameron Newham & Bill Rosenblatt",
      isbn: "978-0596009656",
      edition: 3,
      summary: "# Learning the Bash Shell summary",
      published_at: ~D[2005-04-01],
      tags: "bash, shell, sh, zsh, command line, terminal"
    })

    assert html_response(conn, 302)
  end

  test "POST /books Invalid", %{conn: conn} do
    conn = post(conn, "/books", book: %{
      title: nil,
      author: "Cameron Newham & Bill Rosenblatt",
      isbn: "978-0596009656",
      edition: 3,
      summary: "# Learning the Bash Shell summary",
      published_at: ~D[2005-04-01],
      tags: "bash, shell, sh, zsh, command line, terminal"
    })

    assert html_response(conn, 200) =~ "can&#39;t be blank"
  end

  test "PUT /books/:id", %{conn: conn} do
    book = fixture(:book)
    conn = put(conn, "/books/#{book.id}", book: %{
      title: "Learning the Super Bash Shell"
    })

    assert html_response(conn, 302)
  end

  test "PUT /books/:id Invalid", %{conn: conn} do
    book = fixture(:book)
    conn = put(conn, "/books/#{book.id}", book: %{
      title: nil
    })

    assert html_response(conn, 200) =~ "can&#39;t be blank"
  end

  test "DELETE /books/:id", %{conn: conn} do
    book = fixture(:book)
    conn = delete(conn, "/books/#{book.id}")

    assert html_response(conn, 302)
  end
end
