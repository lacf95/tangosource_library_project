defmodule TangosourceLibraryProjectWeb.Router do
  use TangosourceLibraryProjectWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TangosourceLibraryProjectWeb do
    pipe_through :browser

    get "/", BooksController, :index
    resources "/books", BooksController
  end
end
