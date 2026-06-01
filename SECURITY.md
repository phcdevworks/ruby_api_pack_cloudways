# Security Policy

## Supported Versions

PHCDevworks applies security fixes to the current release line of this gem.
Please use the latest published version of `ruby_api_pack_cloudways` whenever
possible.

## Reporting a Vulnerability

Do not open a public issue for security problems.

Use GitHub Security Advisories for this repository whenever possible. If that
is not available, contact the maintainers through GitHub.

Include:

1. A clear description of the issue and its impact
2. Steps to reproduce or a proof of concept
3. Affected versions, if known
4. Any suggested mitigation

## Response Expectations

1. We aim to acknowledge reports within 48 hours.
2. We aim to provide an initial assessment within 5 business days.
3. We will coordinate disclosure timing with the reporter when possible.

## Security Guidance

- Store Cloudways API keys in Rails credentials, environment variables, or a
  secure deployment secret manager.
- Do not commit Cloudways API keys, OAuth access tokens, production account
  identifiers, live server identifiers, or raw production API responses.
- Keep Ruby, Bundler, HTTParty, Oj, and test dependencies up to date.
- Review automated dependency updates and advisories before release.
- Avoid enabling HTTP debug output in production logs when it could expose
  request or response material.
- Use WebMock or VCR with sanitized fixtures for tests.

## Contact

For non-sensitive security questions, open an issue or discussion in this
repository.
