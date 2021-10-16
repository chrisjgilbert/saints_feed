defmodule SaintsFeed.News do
  alias SaintsFeed.Repo
  alias SaintsFeed.News.Story

  def list_stories do
    Story |> Repo.all()
  end

  def create_story(params) do
    %Story{}
    |> Story.changeset(params)
    |> Repo.insert()
  end
end
