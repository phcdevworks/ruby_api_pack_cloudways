# Ruby API Pack Cloudways Agent Guide

## Repository Snapshot

| Field | Value |
|-------|-------|
| Project team | `project-ruby` |
| Repository role | Cloudways API client |
| Package/artifact | `ruby_api_pack_cloudways` |
| Validation gate | `bundle exec rspec` + `bundle exec rubocop` + `gem build ruby_api_pack_cloudways.gemspec` |

## Standard Authority Model

| Agent | Role | Authority |
|-------|------|-----------|
| Claude Code | Lead implementation and validation | [CLAUDE.md](CLAUDE.md) |
| OpenAI Codex | Documentation, release readiness, stabilization, and repo hygiene | [CODEX.md](CODEX.md) |
| ChatGPT | Strategy, coordination, prompt design, and external review | Support only |
| GitHub Copilot | Development assistance | [COPILOT.md](COPILOT.md) |
| Google Jules | Bounded automated maintenance | [JULES.md](JULES.md) |

Bradley Potts holds final authority for commits, merges, tags, publishing, and
releases.

## Standard Handoff

Every AI-prepared change should report files changed, validation performed,
public behavior or contract impact, and unresolved risks. Do not edit generated
outputs directly. Do not update [CHANGELOG.md](CHANGELOG.md) unless the change
is release-relevant.

This repository is maintained by PHCDevworks and contains the
`ruby_api_pack_cloudways` gem for Cloudways API access from Ruby and Rails
applications.

## Upstream Requests and Roadmap Self-Expansion

Full directive: project-team [AGENTS.md](../AGENTS.md) "Upstream Requests and
Roadmap Self-Expansion." Applied to this repo:

- This gem has no upstream or downstream dependency on any other repo within
  this workspace — it is an independent gem; do not invent a relationship.
  Any consuming Rails application lives outside this workspace.
- No repo in this workspace is known to depend on this gem. If one ever does,
  it should append requests to this repo's own `TODO.md` under `##
  Requested by Downstream`, kept visible and separate from self-planned work.
- This repo's own `ROADMAP.md` may be proactively expanded with new or
  reordered phases by the agent's own analysis — but never mark a phase
  delivered without `bundle exec rspec`, `bundle exec rubocop`, and
  `gem build ruby_api_pack_cloudways.gemspec` all passing, and never
  introduce a dependency on another `project-ruby` gem without an explicit
  architectural decision (see `project-ruby/CLAUDE.md` "How the Repos
  Relate").
- Surface any new TODO request or roadmap expansion in the handoff for Bradley
  Potts in the same change it was made, and reflect cross-repo-relevant
  changes in the project-team's own ROADMAP.md/TODO.md.

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
