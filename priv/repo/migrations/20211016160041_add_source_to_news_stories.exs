defmodule SaintsFeed.Repo.Migrations.AddSourceToNewsStories do
  use Ecto.Migration

  def change do
    alter table(:news_stories) do
      add :source_id, references(:sources)
    end
  end
end
