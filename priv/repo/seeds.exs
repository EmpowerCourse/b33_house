# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     B33House.Repo.insert!(%B33House.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias B33House.{Repo, City, State, Style, House, HouseStyle, HouseFloor}

ws = Repo.insert!(%City{id: 1, name: "Winston-Salem"})
Repo.insert!(%City{id: 2, name: "Dallas"})
Repo.insert!(%City{id: 3, name: "Paris"})

IO.puts "added cities"

nc = Repo.insert!(%State{id: 1, name: "North Carolina", abbr: "NC"})
Repo.insert!(%State{id: 2, name: "Texas", abbr: "TX"})
Repo.insert!(%State{id: 3, name: "Oregon", abbr: "OR"})

IO.puts "added states"

mcm = Repo.insert!(%Style{id: 1, name: "Mid Century Modern"})
ranch = Repo.insert!(%Style{id: 2, name: "Ranch"})
Repo.insert!(%Style{id: 3, name: "Farmhouse"})

IO.puts "added styles"

opt_1 = Repo.insert!(House.changeset(%House{}, %{
  address_line_1: "123 Main Street",
  city_id: ws.id,
  state_id: nc.id,
  zip_code: "27103-0098",
  fenced_in_yard: true,
  carport: true,
  car_capacity: 2,
  finished_basement_sq_ft: 300
}))

IO.puts "added houses"


Repo.insert!(HouseFloor.changeset(%HouseFloor{}, %{
  house_id: opt_1.id,
  floor_number: 1,
  beds: 2,
  baths: 1.5,
  includes_main_br: true,
  room_count: 5
}))

Repo.insert!(HouseFloor.changeset(%HouseFloor{}, %{
  house_id: opt_1.id,
  floor_number: 2,
  beds: 1,
  baths: 0,
  includes_main_br: false,
  room_count: 1
}))

IO.puts "added house_floors"


Repo.insert!(HouseStyle.changeset(%HouseStyle{}, %{
  house_id: opt_1.id,
  style_id: mcm.id
}))

Repo.insert!(HouseStyle.changeset(%HouseStyle{}, %{
  house_id: opt_1.id,
  style_id: ranch.id
}))

IO.puts "added house_styles"
