defmodule TangosourceLibraryProject.CoverUploader do
  use Arc.Definition
  use Arc.Ecto.Definition

  @versions [:original, :thumb]

  def validate({file, _}) do
    ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  end

  def transform(:thumb, _) do
    {:convert, "-resize 200"}
  end

  def filename(version, {_file, scope}) do
    "#{version}_#{scope.id}"
  end
end
