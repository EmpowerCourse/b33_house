defmodule B33House.City do
  use Ecto.Schema
  import Ecto.{Query, Changeset}, warn: false

  @primary_key {:id, :integer, []}
  @derive {Phoenix.Param, key: :id}

  schema "cities" do
    field :name, :string
  end

  @available_fields ~w(name)a

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @available_fields, empty_values: [])
  end
end
