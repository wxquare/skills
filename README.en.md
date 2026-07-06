# AI Skills Collection

[简体中文](./README.md) | [English](./README.en.md)

A growing collection of reusable skills for AI coding agents such as Codex and Claude Code.

This repository is where I organize the workflows I use repeatedly in day-to-day engineering work, then package them into reusable skills that can be triggered by an agent when the problem matches.

## What This Repository Is

These skills are designed to make agent behavior more consistent for recurring engineering tasks such as:

- code review
- technical design writing and review
- integration test planning
- integration test result summarization
- architecture and software diagram generation

The goal is not to store prompts casually. The goal is to build reusable, reviewable, and verifiable skill assets that improve how an agent works.

## Design Principles

This repository favors skills that are:

- reusable across projects instead of tied to one codebase
- explicit about when they should trigger
- supported by references, examples, and non-goals
- easy to validate as the skill set evolves

Each core skill is expected to include:

- a `SKILL.md` entry point
- `references/test-prompts.md` with trigger examples
- `references/non-goals.md` with counterexamples
- `agents/openai.yaml` for UI-facing metadata when applicable

## Skill Catalog

| Skill | Purpose | Directory |
| --- | --- | --- |
| `code-review` | Review diffs, patches, PRs, and high-risk code changes with prioritized findings. | [`code-review/`](./code-review/) |
| `excalidraw-diagram` | Choose the right software diagram and generate strong Excalidraw visuals for architecture, flows, ERDs, onboarding, and incident analysis. | [`excalidraw-diagram/`](./excalidraw-diagram/) |
| `technical-design` | Write or review technical designs, architecture proposals, decision records, rollout plans, and risk reviews. | [`software-tech-design/`](./software-tech-design/) |
| `integration-test-plan` | Turn PRD, TD, diffs, and API changes into reviewable integration test plans. | [`software-testing/integration-test-plan/`](./software-testing/integration-test-plan/) |
| `integration-test-result` | Summarize executed integration tests into reviewable result reports with evidence and gaps. | [`software-testing/integration-test-result/`](./software-testing/integration-test-result/) |

## External Skills / Skill Suites

Besides the engineering skills maintained in this repository, I also want this README to track useful external skills and domain-specific skill suites.

By default, external resources are indexed here but not copied into this repository. That keeps the boundary clear and avoids:

- drifting away from upstream updates
- mixing unrelated repository structures into this collection
- inflating this repo with external project contents

Current recommendation:

| Name | Type | Notes | Link |
| --- | --- | --- | --- |
| `InvestSkill / us-stock-analysis` | Domain skill suite | A skill suite for US stock research and investment analysis, covering stock evaluation, valuation, financial reports, technical analysis, and portfolio review. | [yennanliu/InvestSkill](https://github.com/yennanliu/InvestSkill) |

If an external skill later needs deep customization, unified validation assets, or alignment with this repository's structure, it can be internalized then.

## Repository Layout

Most skills follow a structure like this:

```text
skill-name/
├── SKILL.md
├── agents/
│   └── openai.yaml
├── references/
│   ├── test-prompts.md
│   ├── non-goals.md
│   └── ...
└── scripts/
    └── ...
```

Meaning:

- `SKILL.md`: the main skill definition and workflow
- `agents/openai.yaml`: human-facing metadata for skill pickers or UI integrations
- `references/`: supporting material, examples, templates, and validation assets
- `scripts/`: optional helpers for validation, rendering, or repeatable tasks

## Validation

This repository includes lightweight validation assets so skills do not drift silently over time.

- Trigger examples live in `references/test-prompts.md`
- Non-trigger examples live in `references/non-goals.md`
- Static checks can be run with:

```bash
./scripts/quick_validate.sh
```

## Usage Notes

These skills are intended for agent environments that support skill-style loading and triggering.

Different agent platforms may load skills differently, but the repository structure is intentionally simple:

- each skill lives in its own directory
- trigger intent is declared in `SKILL.md`
- heavier guidance is pushed into `references/`

## Roadmap

This repository will continue to grow as more recurring workflows get extracted into reusable skills.

Planned directions include:

- more engineering review skills
- more testing and debugging skills
- better validation and drift checks
- cleaner GitHub-facing documentation for each individual skill

## License

No license has been added yet.
