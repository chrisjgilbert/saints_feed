defmodule SaintsFeed.Repo.Migrations.CreateNewsStories do
  use Ecto.Migration

  def change do
    create table(:news_stories) do
      add :title,       :string
      add :description, :text
      add :link,        :string
      add :source_guid, :string

      timestamps()
    end
  end
end
