defmodule TangosourceLibraryProjectWeb.BooksControllerTest do
  use TangosourceLibraryProjectWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "The TangoSource Library Project"
  end

  test "GET /books", %{conn: conn} do
    conn = get(conn, "/books")
    assert html_response(conn, 200) =~ "The TangoSource Library Project"
  end
end
