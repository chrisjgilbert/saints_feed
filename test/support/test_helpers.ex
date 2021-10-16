defmodule SaintsFeed.TestHelpers do
  alias SaintsFeed.News

  def story_fixture(attrs \\ %{}) do
    {:ok, story} =
      attrs
      |> Enum.into(%{
        title: "the title",
        description: "the description",
        link: "www.example.com"
      })
      |> News.create_story()

    story
  end
end
