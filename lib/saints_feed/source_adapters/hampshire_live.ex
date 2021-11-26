defmodule SaintsFeed.SourceAdapters.HampshireLive do
  import SweetXml

  alias SaintsFeed.SourceAdapters.{Const, SourceAdapter}

  use SourceAdapter,
    name: Const.hampshire_live(),
    url: Const.hampshite_live_feed()

  @behaviour SourceAdapter

  @impl SourceAdapter
  def parse_feed(xml) do
    xml
    |> xpath(
      ~x"//item"l,
      title: ~x"./title/text()"s,
      description: ~x"./description/text()"s,
      link: ~x"./link/text()"s,
      source_guid: ~x"./guid/text()"s
    )
  end
end
