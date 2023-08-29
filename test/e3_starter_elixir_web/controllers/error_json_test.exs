defmodule B33HouseWeb.ErrorJSONTest do
  use B33HouseWeb.ConnCase, async: true

  test "renders 404" do
    assert B33HouseWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert B33HouseWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
