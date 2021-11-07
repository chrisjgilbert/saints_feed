defmodule SaintsFeed.News do
  import Ecto.Query, only: [limit: 2]

  alias SaintsFeed.Repo
  alias SaintsFeed.News.{Story, Source}

  def list_stories do
    Story
    |> limit(25)
    |> Repo.all()
    |> Repo.preload(:source)
  end

  def create_story(%Source{} = source, params) do
    %Story{}
    |> Story.changeset(params)
    |> Ecto.Changeset.put_assoc(:source, source)
    |> Repo.insert()
  end

  def upsert_story(%Source{} = source, params) do
    %Story{}
    |> Story.changeset(params)
    |> Ecto.Changeset.put_assoc(:source, source)
    |> Repo.insert!(
      on_conflict: [
        set: [link: params[:link], description: params[:description], title: params[:title]]
      ],
      conflict_target: [:source_id, :source_guid]
    )
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
