defmodule TangosourceLibraryProject.BookCoverUploader do
  use Arc.Definition
  use Arc.Ecto.Definition

  @versions [:original, :thumb]

  def validate({file, _}) do
    ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  end

  def transform(:thumb, _) do
    {:convert, "-resize 200"}
  end

  def filename(version, {_file, _scope}) do
    "#{version}_cover"
  end

  def storage_dir(_version, {_file, scope}) do
    "uploads/#{model_name(scope)}/#{scope.id}"
  end

  def model_name(scope) do
    scope.__meta__.source()
  end
end
