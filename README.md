# Ruby API Pack Cloudways

`ruby_api_pack_cloudways` is a Ruby gem for interacting with the Cloudways
API. It provides easy access to providers, server sizes, apps, and packages,
with built-in OAuth authentication for secure API requests.

Maintained by [PHCDevworks](https://go.phcdev.co). It is built on
`ruby_api_pack_core`, which supplies its shared HTTP client, response
validation, and configuration pattern.

## Repository Snapshot

| Field | Value |
|-------|-------|
| Project team | `project-ruby` |
| Repository role | Cloudways API client |
| Package/artifact | `ruby_api_pack_cloudways` |
| Current version/status | 0.4.0 |

## Standard Workflow

1. Read [AGENTS.md](AGENTS.md), then the agent-specific guide for the task.
2. Check [TODO.md](TODO.md) and [ROADMAP.md](ROADMAP.md) for current scope.
3. Make the smallest repo-local change that satisfies the task.
4. Run `bundle exec rspec`, `bundle exec rubocop`, and
   `gem build ruby_api_pack_cloudways.gemspec` when validation is required or
   practical.
5. Update docs and changelog history only when behavior, public contracts, or
   release-relevant metadata changed.

## Documentation Map

| Guide | Path |
|-------|------|
| Agent rules | [AGENTS.md](AGENTS.md) |
| Claude Code | [CLAUDE.md](CLAUDE.md) |
| Codex | [CODEX.md](CODEX.md) |
| Copilot | [COPILOT.md](COPILOT.md) |
| Jules | [JULES.md](JULES.md) |
| Roadmap | [ROADMAP.md](ROADMAP.md) |
| Todo | [TODO.md](TODO.md) |
| Changelog | [CHANGELOG.md](CHANGELOG.md) |
| Security | [SECURITY.md](SECURITY.md) |
| Code of Conduct | [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) |
| Contributing | [CONTRIBUTING.md](CONTRIBUTING.md) |

[![Gem Version](https://img.shields.io/gem/v/ruby_api_pack_cloudways.svg)](https://rubygems.org/gems/ruby_api_pack_cloudways)
[![CircleCI](https://img.shields.io/circleci/build/github/phcdevworks/ruby_api_pack_cloudways/main.svg)](https://circleci.com/gh/phcdevworks/ruby_api_pack_cloudways)
[![codecov](https://codecov.io/gh/phcdevworks/ruby_api_pack_cloudways/graph/badge.svg?token=BEEHE8A5D1)](https://codecov.io/gh/phcdevworks/ruby_api_pack_cloudways)
[![License](https://img.shields.io/github/license/phcdevworks/ruby_api_pack_cloudways.svg)](MIT-LICENSE)

`ruby_api_pack_cloudways` is a Ruby gem for working with the Cloudways API from
Ruby and Rails applications. It centralizes Cloudways credentials, OAuth token
fetching, authenticated requests, response parsing, list endpoints, and server
operations behind a small service-style API.

[Contributing](CONTRIBUTING.md) | [Code of Conduct](CODE_OF_CONDUCT.md) |
[Changelog](CHANGELOG.md) | [Roadmap](ROADMAP.md) |
[Security Policy](SECURITY.md) | [AI Guide](AGENTS.md)

## Source of Truth

The public behavior of this gem is defined by the configuration object, the
Cloudways connection layer, API endpoint wrappers, response validation, and
RSpec coverage. Keep those surfaces aligned whenever endpoint behavior changes.

| Layer | Path | Rule |
| --- | --- | --- |
| Gem entry point | `lib/ruby_api_pack_cloudways.rb` | Loads dependencies and exposes configuration |
| Configuration | `lib/ruby_api_pack_cloudways/configuration.rb` | Owns Cloudways API URL, token path, email, and API key settings |
| Token handling | `lib/ruby_api_pack_cloudways/connection/cw_token.rb` | Fetches and caches Cloudways OAuth access tokens |
| HTTP connection | `lib/ruby_api_pack_cloudways/connection/cw_connect.rb` | Performs authenticated GET and POST requests |
| List endpoints | `lib/ruby_api_pack_cloudways/api/cw_lists.rb` | Public list helpers for Cloudways metadata |
| Server endpoints | `lib/ruby_api_pack_cloudways/api/cw_server.rb` | Public server-management helpers |
| Response validation | `lib/ruby_api_pack_cloudways/handlers/response_validator.rb` | Normalizes expected list responses and logs validation failures |
| Specs | `spec/` | Contract and regression coverage for configuration, connection, handlers, and API wrappers |

After behavior changes, run:

```bash
bundle exec rspec
bundle exec rubocop
gem build ruby_api_pack_cloudways.gemspec
```

## What This Gem Owns

- Cloudways API configuration for Ruby and Rails consumers
- OAuth token fetching and short-lived token caching
- Authenticated JSON GET and POST requests through HTTParty
- Cloudways list helpers for apps, providers, regions, packages, settings, and
  monitoring metadata
- Cloudways server helpers for listing, details, lifecycle actions, cloning,
  scaling, block storage, upgrades, and labels
- Response validation for list-style Cloudways responses

## What This Gem Does Not Own

- Cloudways account setup, billing, provider availability, or API permissions
- Host application credential storage
- Host application authorization policy around server actions
- UI components, admin dashboards, or deployment workflows
- Long-running job orchestration around Cloudways operations

## Installation

Add the gem to your application's Gemfile:

```ruby
gem "ruby_api_pack_cloudways"
```

Install dependencies:

```bash
bundle install
```

Or install it directly:

```bash
gem install ruby_api_pack_cloudways
```

## Configuration

Configure the gem before making API calls. In Rails, this usually belongs in an
initializer such as `config/initializers/ruby_api_pack_cloudways.rb`.

```ruby
RubyApiPackCloudways.configure do |config|
  config.api_url = "https://api.cloudways.com/api/v1"
  config.api_path_token = "/oauth/access_token"
  config.api_email = ENV.fetch("CLOUDWAYS_API_EMAIL")
  config.api_key = ENV.fetch("CLOUDWAYS_API_KEY")
end
```

Do not commit real Cloudways API keys. Use Rails credentials, environment
variables, or your deployment secret manager.

## Usage

### List Endpoints

List helpers return arrays from Cloudways metadata endpoints.

```ruby
providers = RubyApiPackCloudways::Api::CwLists.provider_list
sizes = RubyApiPackCloudways::Api::CwLists.server_size_list
apps = RubyApiPackCloudways::Api::CwLists.app_list
packages = RubyApiPackCloudways::Api::CwLists.package_list
regions = RubyApiPackCloudways::Api::CwLists.region_list
```

Available list helpers:

| Method | Cloudways resource |
| --- | --- |
| `app_list` | Applications |
| `backup_frequency_list` | Backup frequencies |
| `country_list` | Countries |
| `monitor_duration_list` | Monitoring durations |
| `monitor_target_list` | Monitoring targets |
| `package_list` | Packages |
| `provider_list` | Providers |
| `region_list` | Regions |
| `server_size_list` | Server sizes |
| `setting_list` | Settings |

### Server Endpoints

Server helpers call Cloudways server-management endpoints.

```ruby
servers = RubyApiPackCloudways::Api::CwServer.server_list
details = RubyApiPackCloudways::Api::CwServer.server_details("123")

RubyApiPackCloudways::Api::CwServer.restart_server("123")
RubyApiPackCloudways::Api::CwServer.update_server_label("123", label: "Production")
```

Available server helpers:

| Method | Purpose |
| --- | --- |
| `server_list` | List servers |
| `server_details(server_id)` | Fetch server details |
| `create_server(params)` | Create a server |
| `clone_server(server_id, params)` | Clone a server |
| `delete_server(server_id)` | Delete a server |
| `start_server(server_id)` | Start a server |
| `stop_server(server_id)` | Stop a server |
| `restart_server(server_id)` | Restart a server |
| `disk_usage(server_id)` | Fetch disk usage |
| `attach_block_storage(server_id, params)` | Attach block storage |
| `scale_block_storage(server_id, params)` | Scale block storage |
| `scale_volume_size(server_id, params)` | Scale volume size |
| `update_server_label(server_id, params)` | Update a server label |
| `upgrade_server(server_id, params)` | Upgrade a server |

## Development

Install dependencies:

```bash
bundle install
```

Run the test suite:

```bash
bundle exec rspec
```

Run style checks:

```bash
bundle exec rubocop
```

Build the gem locally:

```bash
gem build ruby_api_pack_cloudways.gemspec
```

RSpec uses WebMock and VCR. Keep specs isolated from live Cloudways calls unless
a maintainer explicitly asks for live API verification.

## Documentation and AI Guides

This repository uses the standardized PHCDevworks documentation model adapted
from `phcdevworks/spectre-tokens` and the Rails/Ruby guidance in
`phcdevworks/phcdevworks_accounts_stytch`:

- `AGENTS.md` defines shared AI boundaries.
- `CLAUDE.md`, `CODEX.md`, `COPILOT.md`, and `JULES.md` define agent-specific
  working rules.
- `.github/copilot-instructions.md` and `.github/codex-instructions.md` provide
  GitHub-integrated assistant guidance.
- `CHANGELOG.md`, `ROADMAP.md`, and `TODO.md` keep release and planning context
  visible.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for setup, coding standards, pull
request expectations, and release hygiene.

## Security

Please do not report vulnerabilities through public issues. Follow
[SECURITY.md](SECURITY.md) for responsible disclosure.

## License

The gem is available as open source under the terms of the
[MIT License](MIT-LICENSE).
