defmodule SaintsFeed.SourceAdapters.SourceAdapter do
  alias SaintsFeed.News

  @callback parse_feed(HTTPoison.Response.t() | HTTPoison.AsyncResponse.t()) ::
              list(map())

  defmacro __using__(opts) do
    name = Keyword.get(opts, :name)
    url = Keyword.get(opts, :url)

    quote do
      def run do
        get_feed!()
        |> parse_feed()
        |> upsert_news_stories()
      end

      defp get_feed! do
        HTTPoison.get!(unquote(url)).body
      end

      defp upsert_news_stories(stories) do
        Enum.each(stories, &upsert_news_story/1)
      end

      # TODO: this should be an insert all
      defp upsert_news_story(story) do
        News.upsert_story(source(), story)
      end

      defp source do
        News.get_source_by(name: unquote(name))
      end
    end
  end
end
