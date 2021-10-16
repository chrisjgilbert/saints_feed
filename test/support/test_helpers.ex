defmodule SaintsFeed.TestHelpers do
  alias SaintsFeed.News
  alias SaintsFeed.News.Source

  def story_fixture(%Source{} = source, attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        title: "the title",
        description: "the description",
        link: "www.example.com"
      })

    {:ok, story} = News.create_story(source, attrs)

    story
  end

  def source_fixture(attrs \\ %{}) do
    {:ok, source} =
      attrs
      |> Enum.into(%{
        name: "the name"
      })
      |> News.create_source()

    source
  end
end
