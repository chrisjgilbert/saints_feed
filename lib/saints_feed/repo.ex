defmodule SaintsFeed.Repo do
  use Ecto.Repo,
    otp_app: :saints_feed,
    adapter: Ecto.Adapters.Postgres
end
