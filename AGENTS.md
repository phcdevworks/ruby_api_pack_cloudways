# Ruby API Pack Cloudways Agent Guide

This repository is maintained by PHCDevworks and contains the
`ruby_api_pack_cloudways` gem for Cloudways API access from Ruby and Rails
applications.

## Primary AI Developer

**Claude Code** is the designated primary implementation agent for this
repository. Human final review, commit, merge, tag, publish, and release
authority rests with Bradley Potts and PHCDevworks maintainers.

No AI agent should create commits, tags, releases, or publish gems unless
explicitly asked by the human maintainer.

## AI Operating Model

| Agent | Role | Authority |
| --- | --- | --- |
| Claude Code | Lead implementation for Ruby API wrapper behavior | `CLAUDE.md` |
| OpenAI Codex | Documentation, release readiness, repo hygiene, stabilization, and config standardization | `CODEX.md` |
| ChatGPT | Strategy, coordination, prompt design, and external review support | Support only |
| GitHub Copilot | IDE assistance, local edits, specs, and refactors | `COPILOT.md` |
| Google Jules | Bounded automated maintenance and small dependency updates | `JULES.md` |

## Shared Source Rules

| Path | Status | Notes |
| --- | --- | --- |
| `lib/ruby_api_pack_cloudways.rb` | May edit carefully | Public gem entry point and configuration hook |
| `lib/ruby_api_pack_cloudways/configuration.rb` | May edit carefully | Public configuration surface |
| `lib/ruby_api_pack_cloudways/connection/` | May edit | Token and HTTP connection behavior |
| `lib/ruby_api_pack_cloudways/api/` | May edit | Public Cloudways endpoint wrappers |
| `lib/ruby_api_pack_cloudways/handlers/` | May edit | Response validation and logging helpers |
| `spec/` | May edit | Required for behavior changes |
| `README.md`, `CHANGELOG.md`, docs | May edit | Keep public guidance synchronized |
| Credentials, secrets, tokens, live API payloads | Never commit | Do not expose Cloudways secrets or production account data |

Full validation command:

```bash
bundle exec rspec
bundle exec rubocop
gem build ruby_api_pack_cloudways.gemspec
```

## Core Rules

1. Treat configuration, token handling, connection behavior, API wrappers,
   response validation, and specs as the public behavior contract.
2. Keep host-application assumptions out of the gem.
3. Do not log or document live Cloudways API keys, OAuth access tokens,
   production server IDs, or raw production API responses.
4. Keep Cloudways HTTP access centralized through the connection classes.
5. Update README and changelog when public usage changes.
6. Add focused specs for changed endpoint or connection behavior.
7. Preserve unrelated local changes.

## Agent-Specific Guides

- `CLAUDE.md` - primary implementation workflow.
- `CODEX.md` - documentation, release readiness, and stabilization workflow.
- `COPILOT.md` and `.github/copilot-instructions.md` - IDE support workflow.
- `JULES.md` - bounded automated maintenance workflow.

## Pull Request Creation

Every agent that opens a PR must populate every section of the repository PR
template:

- Linked issue - issue number (`#N`) or `N/A`
- Summary of changes - one or two bullets
- Change classification - additive, behavior change, breaking, or docs/config
  only
- Checklist - completed items checked; blocked items left unchecked with a note

Never submit a PR with an empty body or only template headings.
