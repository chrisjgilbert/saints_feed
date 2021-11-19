defmodule SaintsFeed.SourceAdapters.Const do
  def adapters do
    [
      daily_mail(),
      the_daily_echo(),
      hampshire_live()
    ]
  end

  def daily_mail, do: "Daily Mail"
  def daily_mail_feed, do: "https://www.dailymail.co.uk/sport/teampages/southampton.html"

  def the_daily_echo, do: "The Daily Echo"
  def the_daily_echo_feed, do: "https://www.dailyecho.co.uk/sport/saints/rss/"

  def hampshire_live, do: "Hampshire Live"
  def hampshite_live_feed, do: "https://www.hampshirelive.news/sport/?service=rss"
end
