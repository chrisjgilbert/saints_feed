defmodule SaintsFeed.SourceAdapters.SkySports do
  alias SaintsFeed.SourceAdapters.{Const, SourceAdapter}

  use SourceAdapter,
    name: Const.sky_sports(),
    url: Const.sky_sports_feed()

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

  @article_css_path ".news-list__body"
  @title_and_link_css_path ".news-list__headline-link"
  @description_css_path ".news-list__snippet"
  defp parse_articles(document) do
    articles = Floki.find(document, @article_css_path)

    for article <- articles do
      [{"a", [{"class", _}, {"href", link}], [title]}] =
        Floki.find(article, @title_and_link_css_path)

      description =
        Floki.find(article, @description_css_path)
        |> Floki.text()

      build_article(title, link, description)
    end
  end

  defp build_article(title, link, description) do
    %{
      title: String.trim(title),
      description: String.trim(description),
      link: link,
      source_guid: link
    }
  end
end
