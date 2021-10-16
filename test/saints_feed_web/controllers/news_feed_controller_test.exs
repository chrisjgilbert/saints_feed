defmodule SaintsFeedWeb.NewsFeedControllerTest do
  use SaintsFeedWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Saints Feed!"
  end
end
