# TODO

## Documentation

- [x] Standardize README structure.
- [x] Add AI operating guides.
- [x] Standardize community health docs.
- [x] Add changelog and roadmap.
- [ ] Add payload examples for server create, clone, scale, and upgrade actions.
- [ ] Add a Rails initializer example using credentials.

## Ruby Gem

- [x] Review Cloudways HTTP debug output before production use — removed the
      hardcoded `debug_output: $stdout` from `CwConnect`/`CwToken`; see
      `CHANGELOG.md [Unreleased]`, not yet cut as a release.
- [ ] Confirm supported Ruby versions across gemspec, CI, and docs.
- [ ] Add or verify specs for missing negative paths.
- [ ] Consider response wrapper objects for common Cloudways success and error
  shapes.

## Release

- [x] Update development/test gems to latest RubyGems.org releases (bundler,
      rubocop, simplecov, vcr, webmock); gemspec's `ruby_api_pack_core`
      dependency already covers its latest published version under `~> 0.1`.
- [ ] Confirm gemspec metadata links.
- [ ] Document RubyGems release steps.
- [ ] Keep CI, Codecov, and publish workflows aligned with release docs.
- [x] Add a release checklist to `.codex/release-readiness.md`.
