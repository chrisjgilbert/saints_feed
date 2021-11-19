defmodule SaintsFeed.Repo.Migrations.AddUniqueNameIndexToSources do
  use Ecto.Migration

  def change do
    create unique_index(:sources, [:name], name: :unique_name_index)
  end
end
