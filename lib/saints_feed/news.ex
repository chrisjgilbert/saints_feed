defmodule SaintsFeed.News do
  import Ecto.Query

  alias SaintsFeed.Repo
  alias SaintsFeed.News.{Story, Source}

  def list_stories do
    query =
      from(st in Story,
        as: :stories,
        inner_join: so in assoc(st, :source),
        order_by: [desc: st.inserted_at],
        limit: 25,
        preload: [
          source: so
        ]
      )

    Repo.all(query)
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
    |> Repo.insert!(on_conflict: :nothing)
  end

  def create_source(params) do
    %Source{}
    |> Source.changeset(params)
    |> Repo.insert!(on_conflict: :nothing)
  end

  def get_source_by(opts) do
    Repo.get_by(Source, opts)
  end
end
