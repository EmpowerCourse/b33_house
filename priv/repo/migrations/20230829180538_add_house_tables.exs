defmodule B33House.Repo.Migrations.AddHouseTables do
  use Ecto.Migration

  def change do
    create table(:cities, primary_key: false) do
      add :id, :integer, primary_key: true
      add :name, :string, size: 255, null: false
    end

    create table(:states, primary_key: false) do
      add :id, :integer, primary_key: true
      add :name, :string, size: 255, null: false
      add :abbr, :string, size: 5, null: false
    end

    create table(:styles, primary_key: false) do
      add :id, :integer, primary_key: true
      add :name, :string, size: 255, null: false
    end

    create table(:houses) do
      add :address_line_1, :string, size: 255, null: false
      add :address_line_2, :string, size: 255
      add :city_id, references(:cities), null: false
      add :state_id, references(:states), null: false
      add :zip_code, :string, size: 10, null: false
      add :year_built, :integer
      add :fenced_in_yard, :boolean
      add :attached_garage, :boolean
      add :carport, :boolean
      add :car_capacity, :integer
      add :finished_basement_sq_ft, :integer
      add :unfinished_basement_sq_ft, :integer
      timestamps()
    end

    create table(:house_floors) do
      add :house_id, references(:houses), null: false
      add :floor_number, :integer, null: false
      add :beds, :integer, null: false
      add :baths, :float, null: false
      add :includes_main_br, :boolean
      add :room_count, :integer
      timestamps()
    end

    create table(:house_styles) do
      add :house_id, references(:houses), null: false
      add :style_id, references(:styles), null: false
      timestamps()
    end

  end
end
