# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#

alias SaintsFeed.News
alias SaintsFeed.SourceAdapters.Const

for adapter <- Const.adapters() do
  News.create_source(%{name: adapter})
end
