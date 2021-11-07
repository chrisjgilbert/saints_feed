defmodule SaintsFeed.News do
  alias SaintsFeed.Repo
  alias SaintsFeed.News.{Story, Source}

  def list_stories do
    Story
    |> Repo.all()
    |> Repo.preload(:source)
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

  def get_source_by(opts) do
    Repo.get_by(Source, opts)
  end
end
