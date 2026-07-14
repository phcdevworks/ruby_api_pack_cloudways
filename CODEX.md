# CODEX.md - Ruby API Pack Cloudways

## Role

Codex owns documentation standardization, release readiness, repo hygiene,
production stabilization, and configuration consistency for this Ruby/Rails
Cloudways API gem. Claude Code leads implementation changes. Human maintainers
own final commit, merge, tag, publish, and release decisions.

## Default Workflow

1. Inspect the current working tree and preserve unrelated local changes.
2. Read the relevant source, specs, and docs before editing.
3. Make focused changes using existing Ruby and RSpec patterns.
4. Update README, changelog, and AI docs when public guidance changes.
5. Run the validation gate described in [AGENTS.md](AGENTS.md) when feasible.
6. Report any validation that could not be run.

## Documentation Scope

Codex may update:

- `README.md`
- `CONTRIBUTING.md`
- `SECURITY.md`
- `CODE_OF_CONDUCT.md`
- `CHANGELOG.md`
- `ROADMAP.md`
- `TODO.md`
- `AGENTS.md`, `CLAUDE.md`, `CODEX.md`, `COPILOT.md`, `JULES.md`
- `.github/` templates and assistant instructions
- `.codex/` workspace notes

## Review Scope

When reviewing changes, Codex checks:

1. Configuration and endpoint wrapper behavior drift.
2. Missing RSpec coverage for Cloudways API behavior changes.
3. Cloudways secrets, tokens, account data, server IDs, or live payloads exposed
   in docs, logs, fixtures, VCR cassettes, or examples.
4. Inconsistent response parsing or validation behavior.
5. README or changelog drift from the public behavior surface.
6. CI and release workflow mismatch with documented commands.

## Validation Commands

Run the validation gate described in [AGENTS.md](AGENTS.md).

## Hard Limits

- Do not publish the gem unless explicitly asked.
- Do not create commits, tags, or releases unless explicitly asked.
- Do not overwrite unrelated local changes.
- Do not add real Cloudways credentials, OAuth tokens, production server IDs, or
  raw live API payloads to documentation, tests, fixtures, or logs.
