# Ruby API Pack Cloudways Agent Guide

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

## Repository Snapshot

| Field | Value |
|-------|-------|
| Project team | `project-ruby` |
| Repository role | Cloudways API client |
| Package/artifact | `ruby_api_pack_cloudways` |
| Validation gate | `bundle exec rspec` + `bundle exec rubocop` + `gem build ruby_api_pack_cloudways.gemspec` |

## Standard Authority Model

| Agent | Role | Authority |
|-------|------|-----------|
| Claude Code | Lead implementation and validation | [CLAUDE.md](CLAUDE.md) — **no git access** |
| OpenAI Codex | Documentation, release readiness, stabilization, repo hygiene, **and all git operations in this repo** | [CODEX.md](CODEX.md) |
| ChatGPT | Strategy, coordination, prompt design, and external review | Support only |
| GitHub Copilot | Development assistance | [COPILOT.md](COPILOT.md) |
| Google Jules | Bounded automated maintenance | [JULES.md](JULES.md) |

**Claude Code has no git access in this repository, effective 2026-08-13 by
explicit direction from Bradley Potts.** This revokes and replaces the prior
grant of commit, push, and tag authority to Claude Code described below.
Claude Code must not run any git command — read-only (`git status`, `git
diff`, `git log`) or mutating (`git commit`, `git push`, `git tag`, or any
other) — here. Claude Code's role stops at editing files and validating
changes; it then hands off to Codex (or Bradley Potts) to execute any git
operation. See [CLAUDE.md](CLAUDE.md) "Git Access — Denied" for the
repo-specific statement of this policy.

**OpenAI Codex, GitHub Copilot, and Google Jules** retain full commit, push,
and tag authority in this repository, effective 2026-07-25 by explicit
direction from Bradley Potts — see the Commit Policy section in each agent's
own guide ([CODEX.md](CODEX.md), [COPILOT.md](COPILOT.md),
[JULES.md](JULES.md)). **Codex additionally now executes git operations on
behalf of Claude Code's finished work in this repo** — when Claude Code hands
off a validated, ready-to-commit change, Codex is the agent that runs the
actual `git add`/`commit`/`push`/`tag` commands for it. **OpenAI Codex**
additionally has release authority:
Codex cuts releases autonomously — version bump, changelog versioning,
`v<version>` git tag, and GitHub Release publish via `gh` — for every
release-ready `CHANGELOG.md [Unreleased]` section, without waiting for
per-release approval; see `CODEX.md` "Release Mechanics" for the full
procedure. **RubyGems publishing (`gem push`) remains Bradley Potts's sole
authority** — no agent pushes the gem. Bradley Potts retains ultimate
ownership and holds final authority for merges and publishing. This grant
covers git and release operations within each agent's own scope of work as
defined above — it does not expand what any agent is authorized to decide
otherwise. ChatGPT has no repository access and is excluded.

**A commit is not finished until it is pushed.** Every agent with git
authority in this roster must push immediately after committing (`git push`,
including any needed `-u`/tags) as part of the same action — never leave a
commit sitting local only. This closes a recurring gap where an agent commits
and stops short of pushing, leaving work stranded on the machine.

**Commit authorship is human-only.** No agent adds itself (or any other AI)
as a commit author or co-author — no `Co-Authored-By: Claude`/`Codex`/
`Copilot`/`Jules` trailer, no author-field changes, in this repository. The
git author/committer stays Bradley Potts (or the configured human git user)
on every commit, regardless of which agent performed the work. Push and tag
authority above does not extend to authorship attribution.


## Cross-Repo Access

This repo may be worked on standalone or alongside any combination of other
PHCDevworks repos — do not assume the company root or sibling project areas
are present. The following rules are self-contained and apply whether or not
that broader context is available.

**File access.** An agent working in this repo has full read/write access to
every file in this repo. When this repo is present alongside other
PHCDevworks repos (company root or sibling `project-*` areas), the same full
read/write access extends to those repos too — there is no per-repo access
restriction anywhere in this workspace. What differs repo-to-repo is not
*access*, it's *editorial ownership*: each repo's own `CLAUDE.md`/`AGENTS.md`
still governs what changes make sense there (design-token authority, layer
boundaries, etc.) — being able to open and edit a file is not the same as it
being this repo's job to change it.

**Cross-repo changelog and TODO/roadmap requests.** Full rules: company root
[AGENTS.md](../../AGENTS.md) § "Cross-Repo Changelog Sync" and § "Upstream
Requests and Roadmap Self-Expansion." Applied here without exception — this
repo may append `[Unreleased]` changelog entries and downstream TODO requests
to other present repos per those rules, and no AI agent creates commits, tags,
publishes packages, or merges changes in this repo or any other unless that
repo's own agent guide explicitly grants that authority.

## Standard Handoff

Every AI-prepared change should report files changed, validation performed,
public behavior or contract impact, and unresolved risks. Do not edit generated
outputs directly. Do not update [CHANGELOG.md](CHANGELOG.md) unless the change
is release-relevant.

This repository is maintained by PHCDevworks and contains the
`ruby_api_pack_cloudways` gem for Cloudways API access from Ruby and Rails
applications.

## Confidential External Identities

Never record external customer, vendor, user, client-site, or private-project
identities in tracked files, git metadata, reviews, releases, issues, or
handoffs. Use anonymous role-based wording such as "a downstream integration"
or "a production consumer." Public package and platform names are allowed
only when technically required to identify a dependency or supported
integration.

**Zero tolerance, no exceptions.** This is not a case-by-case judgment call.
Every upstream vendor, customer, client, or third-party identity — regardless
of how well-known, already public, or seemingly harmless — is forbidden from
appearing in any file, commit, tag, branch name, PR, issue, roadmap, TODO, or
agent output anywhere in this repo. If a vendor name is already present
anywhere in tracked files, it must be anonymized on sight, not left in place
because it predates this rule.

## Upstream Requests and Roadmap Self-Expansion

Full directive: project-team [AGENTS.md](../AGENTS.md) "Upstream Requests and
Roadmap Self-Expansion." Applied to this repo:

- This gem has no upstream or downstream dependency on any other repo within
  this workspace — it is an independent gem; do not invent a relationship.
  Any consuming Rails application lives outside this workspace.
- No repo in this workspace is known to depend on this gem. If one ever does,
  it should append requests to this repo's own `TODO.md` under `##
  Requested by Downstream`, kept visible and separate from self-planned work.
- This repo's own `ROADMAP.md` may be proactively expanded with new or
  reordered phases by the agent's own analysis — but never mark a phase
  delivered without `bundle exec rspec`, `bundle exec rubocop`, and
  `gem build ruby_api_pack_cloudways.gemspec` all passing, and never
  introduce a dependency on another `project-ruby` gem without an explicit
  architectural decision (see `project-ruby/CLAUDE.md` "How the Repos
  Relate").
- Surface any new TODO request or roadmap expansion in the handoff for Bradley
  Potts in the same change it was made, and reflect cross-repo-relevant
  changes in the project-team's own ROADMAP.md/TODO.md.

## Shared Source Rules

| Path | Status | Notes |
| --- | --- | --- |
| `lib/ruby_api_pack_cloudways.rb` | May edit carefully | Public gem entry point and configuration hook |
| `lib/ruby_api_pack_cloudways/configuration.rb` | May edit carefully | Public configuration surface |
| `lib/ruby_api_pack_cloudways/connection/` | May edit | Token and HTTP connection behavior |
| `lib/ruby_api_pack_cloudways/api/` | May edit | Public Cloudways endpoint wrappers |
| `lib/ruby_api_pack_cloudways/handlers/` | May edit | Response validation and logging helpers |
| `spec/` | May edit | Required for behavior changes |
| `README.md`, `CHANGELOG.md`, docs | May edit | Keep public guidance synchronized |
| Credentials, secrets, tokens, live API payloads | Never commit | Do not expose Cloudways secrets or production account data |

Full validation command:

```bash
bundle exec rspec
bundle exec rubocop
gem build ruby_api_pack_cloudways.gemspec
```

## Core Rules

1. Treat configuration, token handling, connection behavior, API wrappers,
   response validation, and specs as the public behavior contract.
2. Keep host-application assumptions out of the gem.
3. Do not log or document live Cloudways API keys, OAuth access tokens,
   production server IDs, or raw production API responses.
4. Keep Cloudways HTTP access centralized through the connection classes.
5. Update README and changelog when public usage changes.
6. Add focused specs for changed endpoint or connection behavior.
7. Preserve unrelated local changes.

## Agent-Specific Guides

- `CLAUDE.md` - primary implementation workflow.
- `CODEX.md` - documentation, release readiness, and stabilization workflow.
- `COPILOT.md` and `.github/copilot-instructions.md` - IDE support workflow.
- `JULES.md` - bounded automated maintenance workflow.

## Pull Request Creation

Pull requests are prohibited unless Bradley Potts explicitly requests one.
The guidance below applies only to that explicit exception.

For an explicitly requested PR, populate every section of the repository PR
template:

- Linked issue - issue number (`#N`) or `N/A`
- Summary of changes - one or two bullets
- Change classification - additive, behavior change, breaking, or docs/config
  only
- Checklist - completed items checked; blocked items left unchecked with a note

Never submit a PR with an empty body or only template headings.
