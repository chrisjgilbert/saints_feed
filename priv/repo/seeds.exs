# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#

alias SaintsFeed.News
alias SaintsFeed.SourceAdapters.Const

adapters = [
  Const.daily_mail(),
  Const.the_daily_echo(),
  Const.hampshire_live(),
  Const.sky_sports()
]

for adapter <- adapters do
  News.create_source(%{name: adapter})
end
