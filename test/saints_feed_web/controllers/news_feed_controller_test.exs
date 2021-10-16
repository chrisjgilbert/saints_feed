defmodule SaintsFeedWeb.NewsFeedControllerTest do
  use SaintsFeedWeb.ConnCase

  alias SaintsFeed.News

  describe "index/2" do
    test "it renders a list of news feed items", %{conn: conn} do
      source1 = source_fixture(title: "The Daily Echo")
      source2 = source_fixture(title: "Hampshire Live")

      story_fixture(source1, title: "title 1", description: "description 1", link: "www.link1.com")

      story_fixture(source2, title: "title 2", description: "description 2", link: "www.link2.com")

      response =
        get(conn, Routes.news_feed_path(conn, :index))
        |> html_response(200)

      assert response =~ "title 1"
      assert response =~ "description 1"
      assert response =~ "www.link1.com"
      assert response =~ "The Daily Echo"
      assert response =~ "title 2"
      assert response =~ "description 2"
      assert response =~ "www.link2.com"
      assert response =~ "Hampshire Live"
    end
  end
end
