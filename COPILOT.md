# COPILOT.md - Ruby API Pack Cloudways

## Role

GitHub Copilot is a support assistant for local development in this repository.
It may help with Ruby, RSpec, documentation, and small refactors, but it does
not own architecture, release decisions, or final handoff authority.

## Repository Conventions

- Keep Cloudways token fetching centralized in `Connection::CwToken`.
- Keep authenticated HTTP behavior centralized in `Connection::CwConnect`.
- Keep endpoint wrappers small and covered by focused RSpec examples.
- Keep README and changelog aligned with public usage.
- Do not create commits unless explicitly asked.

## Validation

Before handing off non-trivial changes, run the validation gate described in
[AGENTS.md](AGENTS.md).

## Security

Never suggest adding real Cloudways API keys, OAuth access tokens, production
server IDs, account identifiers, or raw live API responses to source control.
