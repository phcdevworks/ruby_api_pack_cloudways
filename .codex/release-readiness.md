# Release Readiness

Use this checklist before a maintainer publishes `ruby_api_pack_cloudways`.

## Validation

- [ ] `bundle exec rspec` passes.
- [ ] `bundle exec rubocop` passes.
- [ ] `gem build ruby_api_pack_cloudways.gemspec` succeeds.

## Release Records

- [ ] `lib/ruby_api_pack_cloudways/version.rb` has the intended version.
- [ ] `CHANGELOG.md` has a dated entry for the intended version.
- [ ] README usage reflects the current public API.
- [ ] Security guidance is current.

## Safety

- [ ] No Cloudways API keys or OAuth tokens are present in source, docs, logs,
      examples, or fixtures.
- [ ] No production server IDs, account identifiers, or raw live Cloudways
      payloads are committed.
- [ ] Any VCR cassettes are sanitized.

## Handoff

- [ ] Summarize change classification.
- [ ] Include validation results.
- [ ] Note any known release risks or skipped checks.
