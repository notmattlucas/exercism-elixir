defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    String.split(path, ".")
    |> Enum.reduce(data, fn key, map -> map[key] end)
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
