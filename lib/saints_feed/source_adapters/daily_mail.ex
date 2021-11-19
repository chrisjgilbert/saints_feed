defmodule SaintsFeed.SourceAdapters.DailyMail do
  alias SaintsFeed.News
  alias SaintsFeed.SourceAdapters.Const

  @name Const.daily_mail()
  @url Const.daily_mail_feed()

  def run do
    get_feed!()
    |> parse_feed()
    |> upsert_news_stories()
  end

  defp get_feed! do
    HTTPoison.get!(@url).body
  end

  defp parse_feed(html) do
    case Floki.parse_document(html) do
      {:ok, document} ->
        parse_articles(document)

      _ ->
        :error
    end
  end

  defp parse_articles(document) do
    headline_article = parse_headline_article(document)
    other_articles = parse_other_articles(document)
    [headline_article | other_articles]
  end

  defp parse_headline_article(document) do
    headline_article = Floki.find(document, ".football_team_news_wrapper .article.article-large")
    [{"a", [{"href", path}], [title]}] = Floki.find(headline_article, "h2.linkro-darkred a")
    description = Floki.find(headline_article, "p.link-ccow.linkro-ccow)") |> Floki.text()

    format_article(title, path, description)
  end

  defp parse_other_articles(document) do
    articles = Floki.find(document, ".football_team_news_wrapper .article.article-small")

    for article <- articles do
      [{"a", [{"href", path}], [title]}] = Floki.find(article, "h2.linkro-darkred a")
      description = Floki.find(article, "p)") |> Floki.text()

      format_article(title, path, description)
    end
  end

  @daily_mail_link_prefix "https://www.dailymail.co.uk"
  defp format_article(title, path, description) do
    %{
      title: "#{String.trim(title)}.",
      description: String.trim(description),
      link: "#{@daily_mail_link_prefix}/#{path}",
      source_guid: path
    }
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
