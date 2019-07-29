defmodule TangosourceLibraryProjectWeb.BooksView do
  use TangosourceLibraryProjectWeb, :view
  import Scrivener.HTML

  require Ordinal

  def ordinalize(number) do
    number |> Ordinal.ordinalize
  end

  def tokenize(tags) when is_nil(tags), do: []

  def tokenize(tags) when is_binary(tags) do
    tags |> String.split(~r/,(\s)?/)
  end
end
