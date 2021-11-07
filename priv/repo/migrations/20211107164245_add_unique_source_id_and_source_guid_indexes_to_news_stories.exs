defmodule SaintsFeed.Repo.Migrations.AddUniqueSourceIdAndSourceGuidIndexesToNewsStories do
  use Ecto.Migration

  def change do
    create unique_index(:news_stories, [:source_id, :source_guid], name: :unique_source_id_and_source_guid_index)
  end
end
