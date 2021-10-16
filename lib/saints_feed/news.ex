defmodule SaintsFeed.News do
  alias SaintsFeed.Repo
  alias SaintsFeed.News.{Story, Source}

  def list_stories do
    Story
    |> Repo.all()
  end

  def create_story(%Source{} = source, params) do
    %Story{}
    |> Story.changeset(params)
    |> Ecto.Changeset.put_assoc(:source, source)
    |> Repo.insert()
  end

  def create_source(params) do
    %Source{}
    |> Source.changeset(params)
    |> Repo.insert()
  end
end
