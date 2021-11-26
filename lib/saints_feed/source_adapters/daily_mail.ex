defmodule SaintsFeed.SourceAdapters.DailyMail do
  alias SaintsFeed.SourceAdapters.{Const, SourceAdapter}

  use SourceAdapter,
    name: Const.daily_mail(),
    url: Const.daily_mail_feed()

  @behaviour SourceAdapter

  @impl SourceAdapter
  def parse_feed(html) do
    case Floki.parse_document(html) do
      {:ok, document} ->
        parse_articles(document)

      _ ->
        []
    end
  end

  defp parse_articles(document) do
    [parse_headline_article(document) | parse_other_articles(document)]
  end

  @large_article_css_path ".football_team_news_wrapper .article.article-large"
  defp parse_headline_article(document) do
    headline_article = Floki.find(document, @large_article_css_path)

    {path, title} = extract_path_and_title_from_article(headline_article)

    description =
      Floki.find(headline_article, "p.link-ccow.linkro-ccow)")
      |> Floki.text()

    build_article(title, path, description)
  end

  @small_article_css_path ".football_team_news_wrapper .article.article-small"
  defp parse_other_articles(document) do
    articles = Floki.find(document, @small_article_css_path)

    for article <- articles do
      {path, title} = extract_path_and_title_from_article(article)

      description =
        Floki.find(article, "p)")
        |> Floki.text()

      build_article(title, path, description)
    end
  end

  @daily_mail_link_prefix "https://www.dailymail.co.uk"
  defp build_article(title, path, description) do
    %{
      title: "#{String.trim(title)}.",
      description: String.trim(description),
      link: "#{@daily_mail_link_prefix}/#{path}",
      source_guid: path
    }
  end

  @link_and_title_css_path "h2.linkro-darkred a"
  defp extract_path_and_title_from_article(article) do
    [{"a", [{"href", path}], [title]}] = Floki.find(article, @link_and_title_css_path)

    {path, title}
  end
end
