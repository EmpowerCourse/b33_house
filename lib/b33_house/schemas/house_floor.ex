defmodule B33House.HouseFloor do
  use Ecto.Schema
  import Ecto.{Query, Changeset}, warn: false

  alias B33House.{House}

  schema "house_floors" do
    belongs_to :house, House
    field :floor_number, :integer
    field :beds, :integer
    field :baths, :float
    field :includes_main_br, :boolean
    field :room_count, :integer

    timestamps()
  end

  @available_fields ~w(house_id floor_number beds baths
    includes_main_br room_count)a

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @available_fields, empty_values: [])
  end
end
