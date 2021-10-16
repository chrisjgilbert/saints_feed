defmodule SaintsFeedWeb.NewsFeedControllerTest do
  use SaintsFeedWeb.ConnCase

  alias SaintsFeed.News

  describe "index/2" do
    test "it renders a list of news feed items", %{conn: conn} do
      story_fixture(title: "title 1", description: "description 1", link: "www.link1.com")
      story_fixture(title: "title 2", description: "description 2", link: "www.link2.com")

      conn = get(conn, Routes.news_feed_path(conn, :index))

      assert html_response(conn, 200) =~ "title 1"
      assert html_response(conn, 200) =~ "description 1"
      assert html_response(conn, 200) =~ "www.link1.com"
      assert html_response(conn, 200) =~ "title 2"
      assert html_response(conn, 200) =~ "description 2"
      assert html_response(conn, 200) =~ "www.link2.com"
    end
  end
end
