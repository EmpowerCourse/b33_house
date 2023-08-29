defmodule B33House.State do
  use Ecto.Schema
  import Ecto.{Query, Changeset}, warn: false

  @primary_key {:id, :integer, []}
  @derive {Phoenix.Param, key: :id}

  schema "states" do
    field :name, :string
    field :abbr, :string
  end

  @available_fields ~w(name abbr)a

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @available_fields, empty_values: [])
  end
end
