# Roadmap

This roadmap tracks the direction for `ruby_api_pack_cloudways` as a Ruby gem
for Cloudways API access. It is planning context, not a release promise.

## Current Focus

- Keep the Cloudways list and server endpoint surface stable and well tested.
- Keep token fetching and authenticated request behavior centralized.
- Improve safety around credentials, HTTP debug output, and test fixtures.
- Keep release hygiene consistent for RubyGems publishing.

## Near-Term

- Expand README examples for common Rails initializer and service-object usage.
- Review HTTP debug output behavior so production consumers do not accidentally
  expose request or response data.
- Add clearer examples for Cloudways server creation and scaling payloads.
- Confirm Ruby version support across gem metadata, CI, and docs.
- Improve response error handling around non-200 Cloudways API responses.

## Later

- Add optional pagination or filtering helpers if Cloudways endpoints require
  them.
- Add generator support for Rails initializer setup if Rails consumers need it.
- Add sanitized VCR cassette examples for representative Cloudways responses.
- Add richer typed response wrappers if downstream apps need stable result
  objects instead of raw hashes.

## Out of Scope

- Cloudways account administration
- Host application authorization policy
- UI components or dashboards
- Deployment orchestration outside Cloudways API calls
- Storing or rotating production Cloudways secrets
