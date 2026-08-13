# CLAUDE.md - Ruby API Pack Cloudways

## Project Identity

**Gem:** `ruby_api_pack_cloudways`
**Owner:** PHCDevworks
**Primary implementation agent:** Claude Code

This repository is a Ruby gem that wraps Cloudways API authentication, list
endpoints, and server operations for Ruby and Rails applications. This file is
the implementation guide for Claude Code. Read `AGENTS.md` first for shared
agent boundaries.

This gem depends on `ruby_api_pack_core` for its connection wrapper base class
(`RubyApiPackCore::Connection::Base`) and configuration mixin
(`RubyApiPackCore::Configurable`). `RubyApiPackCloudways::Connection::CwConnect`
subclasses `RubyApiPackCore::Connection::Base` and only adds Cloudways-specific
behavior (the OAuth bearer token lookup and rate-limit retry). This gem keeps
its own `Handlers::ResponseValidator` locally — its `expected_key` signature
differs intentionally from `ruby_api_pack_core`'s `expected_type` validator and
was not migrated; do not conflate the two. Shared HTTP plumbing beyond that
belongs upstream in `ruby_api_pack_core` — see that repo's own `CLAUDE.md`
before changing anything that looks like generic request/response handling.

## Git Access — Denied

**Claude Code has zero git access in this repo, as part of a companywide
policy.** Claude Code must not run `git commit`, `git push`, `git tag`, or
any other git command — read-only or mutating — here. This supersedes the
prior commit/push/tag grant described in [AGENTS.md](AGENTS.md). OpenAI
Codex now executes all git operations for this repo; see [AGENTS.md](AGENTS.md)
and [CODEX.md](CODEX.md).

When work is ready, Claude Code runs the validation gate described in
[AGENTS.md](AGENTS.md) and then stops short of any git command, handing off
to Codex (or Bradley Potts) with a summary of files changed and validation
performed. `gem push` (RubyGems publish) stays with Bradley Potts.

## Development Workflow

Run `bundle install`, then the validation gate described in
[AGENTS.md](AGENTS.md).

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
   `RubyApiPackCloudways::Connection::CwConnect`, which subclasses
   `RubyApiPackCore::Connection::Base` — only add Cloudways-specific behavior
   there (auth headers, rate-limit retry), do not reimplement URL building,
   status handling, or JSON parsing locally.
3. Keep endpoint methods small and traceable to Cloudways API paths.
4. Keep host app assumptions out of the gem.
5. Avoid broad refactors unless they directly support the requested change.
6. If a change requires modifying generic HTTP behavior (URL building, status
   handling, JSON parsing, or the `configure` pattern) rather than
   Cloudways-specific behavior, make that change in `ruby_api_pack_core`
   instead, and coordinate the version bump here. This gem's own
   `Handlers::ResponseValidator` (the `expected_key` variant) stays local —
   do not merge it into `ruby_api_pack_core`'s `expected_type` validator
   without an explicit decision to change its signature everywhere.
7. Do not expose Cloudways API keys, OAuth tokens, production account data,
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

Claude Code implements features and fixes with a `CHANGELOG.md [Unreleased]`
entry per change. Cutting the release itself — version bump, changelog
versioning, `v<version>` tag, and GitHub Release — is Codex's job; see
`CODEX.md` "Release Mechanics" for the full procedure. `gem push` (RubyGems
publish) stays with Bradley Potts regardless of who prepares the release.
