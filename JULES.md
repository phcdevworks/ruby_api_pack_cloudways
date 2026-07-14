# JULES.md - Ruby API Pack Cloudways

## Role

Google Jules may perform bounded automated maintenance in this repository.
Jules should keep work small, mechanical, and easy to review.

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
