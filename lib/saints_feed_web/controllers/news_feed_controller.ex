defmodule SaintsFeedWeb.NewsFeedController do
  use SaintsFeedWeb, :controller

  alias SaintsFeed.News

  def index(conn, _params) do
    stories = News.list_stories()
    render(conn, "index.html", stories: stories)
  end
end
