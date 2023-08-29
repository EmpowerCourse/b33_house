defmodule B33House.Helper do

  # %{ "filterName" => "city", "filterValue" => "WS"}

  # %{}
  # %{filterName: "city"}
  # %{filterName: "city", filterValue: "WS"}

  def convert_string_map_to_atoms(map) do
    Enum.reduce(map, %{}, fn {key, value}, acc ->
      Map.put(acc, String.to_atom(key), value)
    end)
  end
end
