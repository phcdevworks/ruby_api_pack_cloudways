# Change Watch

Use this file as a lightweight review log when preparing a documentation,
release, or stabilization handoff.

## Current Watch Points

- Public endpoint wrapper changes should update specs and README usage.
- Connection and token changes should be checked for credential or token
  leakage in logs and fixtures.
- Release changes should keep `VERSION`, `CHANGELOG.md`, gem build output, and
  RubyGems publishing state aligned.

## Validation Notes

Record command results here only when useful for a release or PR handoff. Do
not paste secrets or live Cloudways response payloads.
