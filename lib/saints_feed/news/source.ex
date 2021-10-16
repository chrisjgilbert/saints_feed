defmodule SaintsFeed.News.Source do
  use Ecto.Schema
  import Ecto.Changeset

  alias SaintsFeed.News.Source

  schema "sources" do
    field :name, :string

    timestamps()
  end

  def changeset(%Source{} = source, attrs) do
    source
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
