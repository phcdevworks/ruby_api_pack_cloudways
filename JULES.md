# JULES.md - Ruby API Pack Cloudways

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

Google Jules may perform bounded automated maintenance in this repository.
Jules should keep work small, mechanical, and easy to review. Jules has
commit, push, and tag authority per the companywide grant in
[AGENTS.md](AGENTS.md), scoped to the task categories below.

## Appropriate Work

- Dependency update follow-ups
- Small documentation corrections
- CI or configuration cleanup
- Narrow test maintenance
- Formatting updates aligned with RuboCop

## Not Appropriate

- New Cloudways API surface area without human review
- Authentication redesigns
- Release publishing
- Large refactors
- Security-sensitive behavior changes without human review

## Validation

Before handoff, run the validation gate described in [AGENTS.md](AGENTS.md).
If validation cannot run, report why.
