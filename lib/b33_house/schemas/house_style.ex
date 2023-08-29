defmodule B33House.HouseStyle do
  use Ecto.Schema
  import Ecto.{Query, Changeset}, warn: false

  alias B33House.{House, Style}

  schema "house_styles" do
    belongs_to :house, House
    belongs_to :style, Style

    timestamps()
  end

  @available_fields ~w(house_id style_id)a

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @available_fields, empty_values: [])
  end
end
