# CLAUDE.md - Ruby API Pack Cloudways

## Project Identity

**Gem:** `ruby_api_pack_cloudways`
**Owner:** PHCDevworks
**Primary implementation agent:** Claude Code

This repository is a Ruby gem that wraps Cloudways API authentication, list
endpoints, and server operations for Ruby and Rails applications. This file is
the implementation guide for Claude Code. Read `AGENTS.md` first for shared
agent boundaries.

## Commit Policy

Claude Code does not create commits in this repository unless explicitly asked.
Prepare changes, run validation, and leave commit, tag, push, and release
authority to the human maintainer.

## Development Workflow

```bash
bundle install
bundle exec rspec
bundle exec rubocop
gem build ruby_api_pack_cloudways.gemspec
```

Use WebMock and VCR for specs. Do not depend on live Cloudways API calls unless
a maintainer explicitly asks for live verification.

## Public Contract

The public behavior surface is:

- `lib/ruby_api_pack_cloudways.rb`
- `lib/ruby_api_pack_cloudways/configuration.rb`
- `lib/ruby_api_pack_cloudways/connection/cw_token.rb`
- `lib/ruby_api_pack_cloudways/connection/cw_connect.rb`
- `lib/ruby_api_pack_cloudways/api/cw_lists.rb`
- `lib/ruby_api_pack_cloudways/api/cw_server.rb`
- `lib/ruby_api_pack_cloudways/handlers/response_validator.rb`
- `README.md`

Configuration, endpoint, connection, and response changes require matching specs
and a changelog entry.

## Implementation Rules

1. Keep token fetching inside `RubyApiPackCloudways::Connection::CwToken`.
2. Keep authenticated GET and POST behavior inside
   `RubyApiPackCloudways::Connection::CwConnect`.
3. Keep endpoint methods small and traceable to Cloudways API paths.
4. Keep host app assumptions out of the gem.
5. Avoid broad refactors unless they directly support the requested change.
6. Do not expose Cloudways API keys, OAuth tokens, production account data,
   server IDs, or raw live responses in logs, fixtures, docs, or test output.

## Testing Expectations

- New endpoint helpers need direct API wrapper specs.
- Token changes need success, failure, parsing, and cache-path specs.
- Connection changes need GET, POST, parsing, failure, and retry-path specs.
- Response validation changes need direct handler specs.
- Security-sensitive changes should include both success and failure coverage.

## Documentation Expectations

Update:

- `README.md` for public installation, configuration, endpoint, or usage changes.
- `CHANGELOG.md` for every behavior-impacting change.
- `SECURITY.md` when security reporting or credential guidance changes.
- AI docs when agent workflows or authority boundaries change.

## Release Procedure

1. Update `lib/ruby_api_pack_cloudways/version.rb`.
2. Move changelog notes from `[Unreleased]` into a dated version section.
3. Run `bundle exec rspec`.
4. Run `bundle exec rubocop`.
5. Build and publish only when the maintainer explicitly approves.
