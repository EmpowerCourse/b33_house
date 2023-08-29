defmodule B33HouseWeb.HouseController do
  use B33HouseWeb, :controller

  alias B33House.{House, Helper}

  def houses(conn, params) do
    params = params
      |> Helper.convert_string_map_to_atoms()

    params
    |> IO.inspect(label: "PPPPPPPPPPPPPPPPPPPPPPP")
    houses = House.get_all(params)


    json(conn, %{list: houses})
  end
end
