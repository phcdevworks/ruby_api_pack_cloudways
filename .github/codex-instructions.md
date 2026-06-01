# Codex Instructions - Ruby API Pack Cloudways

This file is the GitHub-integrated Codex guide for `ruby_api_pack_cloudways`.
Read `CODEX.md` at the repo root for the full operational playbook. Read
`AGENTS.md` for shared agent boundaries.

## Role Summary

Codex is the release, documentation, production stabilization, repo hygiene, and
configuration standardization agent. Claude Code leads implementation.
PHCDevworks maintainers own all final release decisions.

## Pull Request Creation

When opening a PR, Codex must populate every section of the PR template:

- Linked issue - issue number (`#N`) or `N/A`
- Summary of changes - one or two bullets
- Change classification - additive, behavior change, breaking, or docs/config only
- Type of change - check every box that applies
- Checklist - check each completed item; leave blocked items unchecked with a
  brief note

Never submit a PR with an empty body or with only template headings left
unfilled.

## Pull Request Review Scope

When reviewing a PR, Codex checks:

1. Configuration, token, connection, API wrapper, and docs behavior drift.
2. Missing RSpec coverage for endpoint or connection behavior changes.
3. Cloudways API keys, OAuth tokens, production server IDs, account data, or raw
   live responses exposed in docs, logs, fixtures, VCR cassettes, or examples.
4. README or changelog drift from the public behavior surface.
5. CI and release workflow mismatch with documented commands.

## Issue Triage Scope

Codex triages issues related to:

- Documentation inconsistencies
- Release process questions
- Changelog or versioning questions
- CI and validation failures
- Repo hygiene and configuration standardization

Implementation issues involving new Cloudways endpoints or behavior changes
should be directed to Claude Code.

## Validation Commands

```bash
bundle exec rspec
bundle exec rubocop
gem build ruby_api_pack_cloudways.gemspec
```

## Source of Truth Hierarchy

When guidance conflicts, resolve in this order:

1. `CLAUDE.md`
2. `AGENTS.md`
3. `CODEX.md`
4. `README.md`
5. `CONTRIBUTING.md`

## Hard Limits

- Never add real Cloudways credentials, OAuth tokens, production server IDs, or
  raw live API payloads.
- Never commit, tag, publish, or create releases unless explicitly requested.
- Never override Claude Code's implementation decisions.
