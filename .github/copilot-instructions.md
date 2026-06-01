# GitHub Copilot Instructions for Ruby API Pack Cloudways

## Role

GitHub Copilot is the general development support assistant for this gem.

- Claude Code owns implementation leadership (`CLAUDE.md`).
- Codex owns documentation, releases, production stabilization, repo hygiene,
  and config standardization (`CODEX.md`).
- Jules owns bounded automated maintenance (`JULES.md`).
- Copilot supports editing, refactors, specs, Ruby/API hints, and productivity
  inside the IDE.

Copilot does not own architecture direction, release decisions, or final handoff
authority.

## Package Conventions

- Keep Cloudways configuration in `Configuration`.
- Keep token fetching in `Connection::CwToken`.
- Keep authenticated HTTP behavior in `Connection::CwConnect`.
- Keep endpoint wrappers in `Api::CwLists` and `Api::CwServer`.
- Keep this repo focused on Cloudways API access, not host application policy.

## Working Style

- Prefer narrow, pattern-aligned changes.
- Keep docs and specs in sync when behavior changes.
- Preserve unrelated local changes.
- Do not create commits unless explicitly asked.

## Validation

- Run `bundle exec rspec` for behavior changes.
- Run `bundle exec rubocop` before handoff.
- Build the gem when release packaging changes.

## Pull Request Creation

When opening a PR, populate every section of the repo's PR template:

- Linked issue - issue number (`#N`) or `N/A`
- Summary of changes - one or two bullets
- Change classification - additive, behavior change, breaking, or docs/config only
- Checklist - completed items checked; blocked items left unchecked with a brief note

Never submit a PR with an empty body or only template headings.

## References

- Shared boundaries: `AGENTS.md`
- Lead implementation rules: `CLAUDE.md`
- Release/readiness rules: `CODEX.md`
- Copilot support context: `COPILOT.md`
