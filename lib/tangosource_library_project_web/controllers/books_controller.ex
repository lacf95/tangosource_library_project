defmodule TangosourceLibraryProjectWeb.BooksController do
  use TangosourceLibraryProjectWeb, :controller

  alias TangosourceLibraryProject.{Book, Repo}

  def index(conn, params) do
    page = Book
            |> Repo.paginate(params)
    render(conn, "index.html", books: page.entries, page: page)
  end

  def new(conn, _params) do
    conn |> render("new.html", changeset: Book.new_changeset(%Book{}))
  end

  def show(conn, %{"id" => id}) do
    conn |> render("show.html", book: Book.find!(id))
  end

  def edit(conn, %{"id" => id}) do
    book = Book.find!(id)
    changeset = Book.new_changeset(book)
    conn |> render("edit.html", book: book, changeset: changeset)
  end

  def create(conn, %{"book" => book_params}) do
    case Book.create(book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book Created Successfully.")
        |> redirect(to: Routes.books_path(conn, :show, book))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Something Went Wrong")
        |> render("new.html", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Book.find!(id)

    case Book.update(book, book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book Updated Successfully.")
        |> redirect(to: Routes.books_path(conn, :show, book))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Something Went Wrong")
        |> render("edit.html", book: book, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Book.find!(id)

    case Book.delete(book) do
      {:ok, _book} ->
        conn
        |> put_flash(:info, "Book Deleted Successfully.")
        |> redirect(to: Routes.books_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Something Went Wrong")
        |> render("edit.html", book: book, changeset: changeset)
    end
  end
end
