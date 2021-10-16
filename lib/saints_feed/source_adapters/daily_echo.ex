defmodule SaintsFeed.SourceAdapters.DailyEcho do
  alias SaintsFeed.News

  @name "Daily Echo"

  def run do
    stories = []

    Enum.each(stories, fn story ->
      News.create_story(source(), story)
    end)
  end

  defp source do
    News.find_source_by_name(@name)
  end
end
