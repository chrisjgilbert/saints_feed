defmodule SaintsFeed.News.Story do
  use Ecto.Schema
  import Ecto.Changeset

  schema "news_stories" do
    field :title, :string
    field :description, :string
    field :link, :string
    field :source_guid, :string

    timestamps()
  end

  @doc false
  def changeset(story, attrs) do
    story
    |> cast(attrs, [:title, :description, :link, :source_guid])
    |> validate_required([:title, :description, :link])
  end
end
