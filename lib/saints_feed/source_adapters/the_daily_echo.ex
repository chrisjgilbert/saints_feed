defmodule SaintsFeed.SourceAdapters.TheDailyEcho do
  alias SaintsFeed.SourceAdapters.{Const, SourceAdapter}

  import SweetXml

  use SourceAdapter,
    name: Const.the_daily_echo(),
    url: Const.the_daily_echo_feed()

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
