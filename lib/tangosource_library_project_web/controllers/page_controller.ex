defmodule TangosourceLibraryProjectWeb.PageController do
  use TangosourceLibraryProjectWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
