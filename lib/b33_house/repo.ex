defmodule B33House.Repo do
  use Ecto.Repo,
    otp_app: :b33_house,
    adapter: Ecto.Adapters.Postgres
end
