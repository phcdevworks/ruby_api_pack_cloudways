# Changelog

All notable changes to this project will be documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the versioning
reflects gem releases published to RubyGems.

## [Unreleased]

Change type: docs/config only + architecture alignment

### Added

- Standardized repository documentation using the PHCDevworks documentation
  model established in `phcdevworks/spectre-tokens`.
- Added AI operating guides for shared agent behavior, Codex, Claude Code,
  Copilot, and Jules.
- Added roadmap and TODO planning documents for Ruby/Rails workspace
  stabilization.
- Added GitHub-integrated Codex and Copilot instruction files.

### Changed

- **Breaking (internal only):** `RubyApiPackCloudways::Connection::CwConnect`
  now subclasses `RubyApiPackCore::Connection::Base`, inheriting shared URL
  building, `200..299` status handling (widened from a bare `200` check), and
  `Oj`-based JSON parsing with a content-type guard. `CwConnect` now only
  implements `#auth_headers` (the OAuth bearer token lookup) and an
  `#api_get` override for the rate-limit retry behavior. The pre-existing
  `cloudways_api_connection`/`cloudways_api_post_connection` method names are
  kept as aliases to `api_get`/`api_post` for backward compatibility with
  `CwLists`/`CwServer`, which are unchanged.
- Removed the direct `httparty`/`oj` gemspec dependencies — both now come
  from the new `ruby_api_pack_core` (`~> 0.1`) runtime dependency.
- `RubyApiPackCloudways.configure`/`.configuration` now come from
  `RubyApiPackCore::Configurable` instead of a gem-local implementation;
  behavior is unchanged.
- `RubyApiPackCloudways::Api::CwServer` now extends
  `RubyApiPackCloudways::Handlers::ResponseValidator` (kept local to this gem
  — its `expected_key` signature differs from `ruby_api_pack_core`'s
  `expected_type` validator and was not migrated) and validates
  `server_list`'s response shape, matching `CwLists`'s existing use of the
  validator (previously only `CwLists` validated responses, so `CwServer`
  responses went unchecked).
- Removed the hardcoded `debug_output: $stdout` from `CwConnect` and
  `CwToken`'s HTTParty calls — this previously always printed raw HTTP wire
  traffic (including auth headers) to stdout in every environment, not just
  when debugging.
- Removed debug `puts` of `CLOUDWAYS_API_*` environment variables from the
  spec suite's global `before` hook.
- Fixed the rate-limit retry spec sleeping for a real 60 seconds on every test
  run by stubbing `Kernel#sleep` on the connection instance under test.
- Reworked README, contributing, security, code of conduct, issue templates, and
  pull request template around this gem's Cloudways API responsibilities.
- Enabled RuboCop new-cop handling, removed duplicate lint config, and adjusted
  spec style so the documented validation gate passes.
- Added RubyGems MFA metadata to the gemspec.

## [0.4.0] - 2026-06-02

### Added

- Current gem release line for Cloudways API wrapper behavior.

## [0.1.0] - 2024-09-25

### Added

- Initial release.
