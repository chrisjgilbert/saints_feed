defmodule SaintsFeedWeb.NewsFeedController do
  use SaintsFeedWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
