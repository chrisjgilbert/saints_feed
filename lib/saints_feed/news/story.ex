defmodule SaintsFeed.News.Story do
  use Ecto.Schema
  import Ecto.Changeset

  alias SaintsFeed.News.{Story, Source}

  schema "news_stories" do
    field :title, :string
    field :description, :string
    field :link, :string
    field :source_guid, :string

    belongs_to :source, Source

    timestamps()
  end

  def changeset(%Story{} = story, attrs) do
    story
    |> cast(attrs, [:title, :description, :link, :source_guid])
    |> unique_constraint(:source_id_and_source_guid_index,
      name: :unique_source_id_and_source_guid_index
    )
    |> validate_required([:title, :description, :link])
  end
end
