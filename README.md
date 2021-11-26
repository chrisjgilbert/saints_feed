# SaintsFeed

Learning Elixir & Phoenix by building a "news feed" containing Southampton FC news stories.

Lots of duplicated code & no tests at this stage 🤷

https://saints-feed.gigalixirapp.com/

## TODOs:

- [ ] Add unit tests for `SourceAdapter` modules.
- [ ] Update existing unit tests.
- [ ] Insert all news stories for a source adapter atomically rather than one at a time.
- [ ] Create 1 job that runs all source adapter jobs, rather than defining each in individually `config/config.exs`.
