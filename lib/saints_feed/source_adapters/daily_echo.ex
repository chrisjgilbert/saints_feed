defmodule SaintsFeed.SourceAdapters.DailyEcho do
  import SweetXml

  alias SaintsFeed.News

  @name "The Daily Echo"
  @url "https://www.dailyecho.co.uk/sport/saints/rss/"

  def run do
    get_feed!()
    |> parse_feed()
    |> insert_news_stories()
  end

  defp get_feed! do
    HTTPoison.get!(@url).body
  end

  defp parse_feed(xml) do
    xml
    |> xpath(
      ~x"//item"l,
      title: ~x"./title/text()"s,
      description: ~x"./description/text()"s,
      link: ~x"./link/text()"s,
      source_guid: ~x"./guid/text()"s
    )
  end

  # Refactor to upsert all stories at once
  # https://hexdocs.pm/ecto/constraints-and-upserts.html
  defp insert_news_stories(stories) when length(stories) > 0 do
    Enum.each(stories, &insert_news_story/1)
  end

  defp insert_news_story(story) do
    News.create_story(source(), story)
  end

  defp source do
    News.get_source_by(name: @name)
  end
end
