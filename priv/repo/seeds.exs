# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#

stories = [
  %{
    title: "Alex McCarthy: It will be 'strange' to see no Ward-Prowse",
    description:
      "GOALKEEPER Alex McCarthy admits it will be \"strange\" to see Saints line up without James Ward-Prowse this weekend.",
    link:
      "https://www.dailyecho.co.uk/sport/19649802.alex-mccarthy-will-strange-see-no-ward-prowse"
  },
  %{
    title: "Southampton boss calls Stuart Armstrong Scotland call 'pity'",
    description:
      "STUART Armstrong is available for selection at St Mary’s this Saturday but manager Ralph Hasenhuttl has ruled it \"a pity that he went immediately to the international team.\"",
    link:
      "https://www.dailyecho.co.uk/sport/19647268.southampton-boss-calls-stuart-armstrong-scotland-call-pity"
  },
  %{
    title: "Che Adams ruled out of Southampton vs Leeds United in EPL",
    description:
      "RALPH Hasenhuttl confirms that Che Adams will not be available for selection for the visit of Leeds United to St Mary’s on Saturday.",
    link:
      "https://www.dailyecho.co.uk/sport/19647209.che-adams-ruled-southampton-vs-leeds-united-epl"
  }
]

Enum.each(stories, &SaintsFeed.News.create_story(&1))
