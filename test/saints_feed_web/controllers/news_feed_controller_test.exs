defmodule SaintsFeedWeb.NewsFeedControllerTest do
  use SaintsFeedWeb.ConnCase

  alias SaintsFeed.News

  describe "index/2" do
    test "it renders a list of news feed items", %{conn: conn} do
      source = source_fixture()
      story_fixture(source, title: "title 1", description: "description 1", link: "www.link1.com")
      story_fixture(source, title: "title 2", description: "description 2", link: "www.link2.com")

      response =
        get(conn, Routes.news_feed_path(conn, :index))
        |> html_response(200)

      assert response =~ "title 1"
      assert response =~ "description 1"
      assert response =~ "www.link1.com"
      assert response =~ "title 2"
      assert response =~ "description 2"
      assert response =~ "www.link2.com"
    end
  end
end
