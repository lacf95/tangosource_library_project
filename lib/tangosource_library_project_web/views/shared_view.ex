defmodule TangosourceLibraryProjectWeb.SharedView do
  use TangosourceLibraryProjectWeb, :view
  require Earmark

  def markdown_content(content) do
    content
    |> Earmark.as_html!
    |> raw
  end
end
