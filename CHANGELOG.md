# Changelog

All notable changes to this project will be documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the versioning
reflects gem releases published to RubyGems.

## [Unreleased]

Contract change type: semantic change

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

## [0.4.0] - 2024-11-17

**Release Title:** Phase 0 - Improvements and Fixes

Contract change type: additive

### Added

- Added a countries endpoint wrapper.
- Added response validation across Cloudways API responses.

### Changed

- Improved access-token expiration and caching behavior.
- Improved response parsing and error handling.
- Updated Ruby compatibility in preparation for Rails 8.

### Fixed

- Fixed the monitor-targets and monitor-durations endpoint behavior.
- Fixed SSL communication issues and token-refresh edge cases.

## [0.3.0] - 2024-11-01

**Release Title:** Phase 0 - Implemented Cloudways List API Endpoints

Contract change type: additive

### Added

- Added Cloudways list endpoint wrappers for applications, backup frequencies,
  countries, monitor durations, monitor targets, packages, providers, regions,
  server sizes, and settings.
- Added focused RSpec coverage for the list endpoints.

### Changed

- Hardened JSON deserialization by parsing Cloudways responses with `Oj` in
  strict mode.
- Expanded configuration and endpoint documentation.

## [0.2.0] - 2024-10-30

**Release Title:** Phase 0 - Implemented Cloudways Server API Endpoints

Contract change type: additive

### Added

- Added Cloudways server endpoint wrappers and focused RSpec coverage.
- Added POST request support through `cloudways_api_post_connection`.

### Changed

- Expanded server endpoint setup and usage documentation.

## [0.1.0] - 2024-09-25

**Release Title:** Phase 0 - Official Stable Release

Contract change type: additive

### Added

- Initial release.

[unreleased]: https://github.com/phcdevworks/ruby_api_pack_cloudways/compare/0.4.0...HEAD
[0.4.0]: https://github.com/phcdevworks/ruby_api_pack_cloudways/compare/0.3.0...0.4.0
[0.3.0]: https://github.com/phcdevworks/ruby_api_pack_cloudways/compare/0.2.0...0.3.0
[0.2.0]: https://github.com/phcdevworks/ruby_api_pack_cloudways/compare/0.1.0...0.2.0
[0.1.0]: https://github.com/phcdevworks/ruby_api_pack_cloudways/tree/0.1.0
