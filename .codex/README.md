# Codex Workspace Notes

This folder keeps Codex-facing operational notes for
`ruby_api_pack_cloudways`.

## Default Checks

```bash
bundle exec rspec
bundle exec rubocop
gem build ruby_api_pack_cloudways.gemspec
```

## Documentation Standard

Keep these files synchronized:

- `README.md`
- `CONTRIBUTING.md`
- `CHANGELOG.md`
- `ROADMAP.md`
- `TODO.md`
- `AGENTS.md`
- `CODEX.md`
- `.github/codex-instructions.md`

## Security Reminder

Do not include real Cloudways API keys, OAuth tokens, production server IDs,
account identifiers, or raw live API responses in docs, specs, logs, examples,
or VCR cassettes.
