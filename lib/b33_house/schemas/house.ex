defmodule B33House.House do
  use Ecto.Schema
  import Ecto.{Query, Changeset}, warn: false

  alias B33House.{City, State, House, Repo}
  require Logger

  schema "houses" do
    field :address_line_1, :string
    field :address_line_2, :string
    belongs_to :city, City
    belongs_to :state, State
    field :zip_code, :string
    field :year_built, :integer
    field :fenced_in_yard, :boolean
    field :attached_garage, :boolean
    field :carport, :boolean
    field :car_capacity, :integer
    field :finished_basement_sq_ft, :integer
    field :unfinished_basement_sq_ft, :integer

    timestamps()
  end

  @available_fields ~w(address_line_1 address_line_2 city_id state_id
    zip_code year_built fenced_in_yard attached_garage
    carport car_capacity finished_basement_sq_ft unfinished_basement_sq_ft)a

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @available_fields, empty_values: [])
  end

  def get_all(params) do
    from(h in House)
    |> select([h], %{
      address_line_1: h.address_line_1
    })
    |> filter(params)
    |> Repo.all()
  end

  defp filter(query, params) do
    filter(query, params.filterName, params.filterValue)
  end
  defp filter(query, "zip_code", value) do
    query
    |> where([h], h.zip_code == ^value)
  end
  defp filter(query, "carport", value) do
    query
    |> where([h], h.carport == ^value)
  end
  defp filter(query, "city", value) do
    query
    |> join(:inner, [h], c in assoc(h, :city))
    |> where([_, c], c.name == ^value)
  end
  defp filter(query, filter_name, filter_value) do
    Logger.info("Unknown filter, #{filter_name}, with value, #{filter_value}, was passed to the House module")
    query
  end


  # defp filter(query, %{}), do: query
  # defp filter(query, %{filterName: filter_name, filterValue: value} = params) when filter_name == "city" do
  #   city_filter(query, value)
  # end

  # defp filter(query, %{}), do: query
  # defp filter(query, %{filterName: "city", filterValue: value} = params), do: city_filter(query, value)

  # defp city_filter(query, value) do
  #   query
  #   |> where([h], h == ^value)
  # end
end
