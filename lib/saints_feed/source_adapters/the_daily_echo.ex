defmodule SaintsFeed.SourceAdapters.TheDailyEcho do
  import SweetXml

  alias SaintsFeed.News
  alias SaintsFeed.SourceAdapters.Const

  @name Const.the_daily_echo()
  @url Const.the_daily_echo_feed()

  def run do
    get_feed!()
    |> parse_feed()
    |> upsert_news_stories()
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

  defp upsert_news_stories(stories) when length(stories) > 0 do
    Enum.each(stories, &upsert_news_story/1)
  end

  defp upsert_news_story(story) do
    News.upsert_story(source(), story)
  end

  defp source do
    News.get_source_by(name: @name)
  end
end
