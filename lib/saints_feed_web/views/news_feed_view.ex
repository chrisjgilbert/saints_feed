defmodule SaintsFeedWeb.NewsFeedView do
  use SaintsFeedWeb, :view

  alias SaintsFeed.SourceAdapters.Const

  @image_path_prefix "/images"
  @daily_mail Const.daily_mail()
  @hampshire_live Const.hampshire_live()
  @the_daily_echo Const.the_daily_echo()
  @sky_sports Const.sky_sports()

  def time_from_now(datetime) do
    Timex.from_now(datetime)
  end

  def image_path(@daily_mail), do: "#{@image_path_prefix}/daily_mail.png"

  def image_path(@hampshire_live), do: "#{@image_path_prefix}/hampshire_live.png"

  def image_path(@the_daily_echo), do: "#{@image_path_prefix}/daily_echo.jpeg"

  def image_path(@sky_sports), do: "#{@image_path_prefix}/sky_sports.jpeg"
end
