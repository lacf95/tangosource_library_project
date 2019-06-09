defmodule TangosourceLibraryProjectWeb.BooksView do
  use TangosourceLibraryProjectWeb, :view
  require Ordinal

  def ordinalize(number) do
    number |> Ordinal.ordinalize
  end
end
