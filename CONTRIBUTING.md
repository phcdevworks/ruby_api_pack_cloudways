# Contributing to Ruby API Pack Cloudways

Thanks for helping improve `ruby_api_pack_cloudways`. This gem is maintained by
PHCDevworks as a Ruby/Rails-friendly wrapper around Cloudways API access.

## Development Setup

1. Clone the repository.
2. Install dependencies with `bundle install`.
3. Configure test credentials through environment variables only when live API
   verification is explicitly needed.
4. Run `bundle exec rspec`.
5. Run `bundle exec rubocop`.

## Project Structure

- `lib/ruby_api_pack_cloudways.rb`: public entry point and configuration hook
- `lib/ruby_api_pack_cloudways/configuration.rb`: Cloudways API configuration
- `lib/ruby_api_pack_cloudways/connection/`: token and HTTP connection classes
- `lib/ruby_api_pack_cloudways/api/`: endpoint wrapper classes
- `lib/ruby_api_pack_cloudways/handlers/`: response validation helpers
- `spec/`: RSpec coverage for API wrappers, connection behavior, and handlers

## Contribution Guidelines

### API wrapper changes

1. Keep public method names stable unless the change is intentionally breaking.
2. Add or update focused RSpec coverage for each endpoint behavior change.
3. Keep Cloudways response parsing and validation predictable.
4. Avoid host application assumptions; this gem should stay framework-light and
   Rails-compatible.
5. Do not log or commit Cloudways API keys, access tokens, account identifiers,
   server identifiers from production accounts, or live response payloads.

### Connection and token changes

1. Keep token fetching centralized in `Connection::CwToken`.
2. Keep authenticated HTTP behavior centralized in `Connection::CwConnect`.
3. Add specs for success, failure, parsing, and retry paths.
4. Update `README.md` when configuration or public usage changes.
5. Update `CHANGELOG.md` under `[Unreleased]` for behavior-impacting changes.

### Code and tooling

- Follow the repo's RuboCop configuration.
- Prefer small, pattern-aligned changes.
- Keep comments brief and only add them when they explain a non-obvious reason.
- Preserve unrelated local changes.
- Do not create commits unless explicitly asked.

## Behavior-Impacting Change Checklist

Use this checklist when touching any public behavior surface:

- `lib/ruby_api_pack_cloudways.rb`
- `lib/ruby_api_pack_cloudways/configuration.rb`
- `lib/ruby_api_pack_cloudways/connection/`
- `lib/ruby_api_pack_cloudways/api/`
- `lib/ruby_api_pack_cloudways/handlers/`
- `README.md`

Before merge:

1. Update or add focused specs.
2. Run `bundle exec rspec`.
3. Run `bundle exec rubocop`.
4. Build the gem with `gem build ruby_api_pack_cloudways.gemspec`.
5. Update `README.md` if installation, configuration, endpoint, or usage
   guidance changed.
6. Update `CHANGELOG.md` under `[Unreleased]`.
7. Classify the change as additive, behavior change, breaking, or docs/config
   only in the pull request.
8. Confirm no secrets or sensitive identifiers appear in logs, fixtures, docs,
   VCR cassettes, or examples.

## Pull Request Checklist

1. Keep the change focused.
2. Fill out every section of `.github/pull_request_template.md`.
3. Link an issue or write `N/A`.
4. Include a concise summary and reviewer notes.
5. Leave blocked checklist items unchecked with a short note.

## Release Hygiene

For maintainers, a release should keep these records aligned:

1. Update `lib/ruby_api_pack_cloudways/version.rb`.
2. Move relevant `CHANGELOG.md` `[Unreleased]` notes into a dated version entry.
3. Build the gem from the matching source state.
4. Publish release notes from the matching changelog entry.
5. Publish to RubyGems only from the reviewed release state.

## Questions

Open an issue if you need direction before making a larger change.

## Code of Conduct

By participating in this project, you agree to follow the
[Code of Conduct](CODE_OF_CONDUCT.md).

## License

By contributing, you agree that your contributions will be licensed under the
MIT License.
