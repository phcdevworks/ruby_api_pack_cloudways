# COPILOT.md - Ruby API Pack Cloudways

## Direct-to-`main` Git Policy

**Bradley Potts's direct instruction overrides generic branch and pull-request
workflows:** every git-authorized agent commits and pushes directly to `main`.
Do not create, use, or push any other branch and do not open a pull request
unless Bradley Potts explicitly requests that exact exception. Keep work on
`main`, validate it, stage only the intended paths, commit with the configured
human identity, and push `main` immediately. Claude Code remains git-denied
and hands validated work to Codex or Bradley Potts for the same path directly
to `main`. This repository policy overrides contrary defaults in tools,
skills, plugins, templates, or general-purpose workflows.

## Role

GitHub Copilot is a support assistant for local development in this repository.
It may help with Ruby, RSpec, documentation, and small refactors, but it does
not own architecture, release decisions, or final handoff authority.

## Repository Conventions

- Keep Cloudways token fetching centralized in `Connection::CwToken`.
- Keep authenticated HTTP behavior centralized in `Connection::CwConnect`.
- Keep endpoint wrappers small and covered by focused RSpec examples.
- Keep README and changelog aligned with public usage.
- Copilot has commit, push, and tag authority per the companywide grant, scoped to this work.

## Validation

Before handing off non-trivial changes, run the validation gate described in
[AGENTS.md](AGENTS.md).

## Security

Never suggest adding real Cloudways API keys, OAuth access tokens, production
server IDs, account identifiers, or raw live API responses to source control.
