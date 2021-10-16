defmodule SaintsFeed.NewsTest do
  use SaintsFeed.DataCase, async: true

  alias SaintsFeed.News
  alias SaintsFeed.News.{Story, Source}

  describe "stories" do
    @valid_params %{title: "The title", description: "the description", link: "the link"}
    @invalid_parms %{title: "The title", description: "", link: "the link"}

    test "create_story/1 with valid params creates a story" do
      source = source_fixture()
      {:ok, %Story{} = story} = News.create_story(source, @valid_params)

      assert story.title == @valid_params[:title]
      assert story.description == @valid_params[:description]
      assert story.link == @valid_params[:link]
    end

    test "create_story/1 with invalid data returns error changeset" do
      source = source_fixture()
      {:error, %Ecto.Changeset{}} = News.create_story(source, @invalid_parms)
    end

    test "list_stories/0 returns a list of all stories with associated source preloaded" do
      source = source_fixture()
      %Story{id: id1} = story_fixture(source, title: "title 1")
      %Story{id: id2} = story_fixture(source, title: "title 2")

      assert [%Story{id: ^id1, source: ^source}, %Story{id: ^id2, source: ^source}] =
               News.list_stories()
    end
  end

  describe "sources" do
    @valid_params %{name: "the name"}
    @invalid_params %{name: ""}

    test "create_source/1 with valid params creates a source" do
      {:ok, source} = News.create_source(@valid_params)

      assert source.name == @valid_params[:name]
    end

    test "create_source/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = News.create_source(@invalid_params)
    end
  end
end
