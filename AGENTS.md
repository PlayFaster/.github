# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## Purpose

This is the `PlayFaster/.github` shared repository — it holds reusable GitHub Actions workflows consumed by all PlayFaster Home Assistant projects (integrations and the theme) via `workflow_call`.

## Workflow Architecture

### Two-File Split

Validation is split across two files:

- **`validate.yaml`** — master entry point. Called by every project stub. Accepts all inputs and delegates immediately to `validate-specific.yaml`.
- **`validate-specific.yaml`** — contains all 9 jobs. A `category` input (`integration`, `theme`, or `standard`) gates which jobs run.

Project stubs always call `validate.yaml`. The internal split is invisible to callers.

### Inputs

| Input | Required | Default | Description |
| :-- | :-- | :-- | :-- |
| `category` | No | `integration` | Project type: `integration`, `theme`, or `standard` |
| `component_name` | No | `""` | `custom_components/` subdirectory name (integration only) |
| `gist_id` | No | `""` | Gist ID for the dynamic coverage badge (integration only) |

### Secrets

`GIST_SECRET` (GitHub token with gist write access) — optional, required only for integration projects running `test_val`. Integration stubs pass it explicitly; theme stubs pass no secrets (none are needed).

### Job Summary

| Job | Tool | Category | Blocking |
| :-- | :-- | :-- | :-- |
| `zizmor` | Zizmor | All | Yes |
| `hassfest` | `home-assistant/actions/hassfest` | Integration | Yes |
| `hacs_val` | `hacs/action` (category passed through) | Integration, Theme | Yes |
| `py_val` | Ruff | Integration | Yes |
| `test_val` | pytest + `schneegans/dynamic-badges-action` (Gist coverage badge) | Integration | Yes |
| `file_val` | `check-jsonschema`, `ibiqlik/action-yamllint`, Prettier, `gaurav-nelson/github-action-markdown-link-check` | All (HACS/HA schema checks skipped for standard) | Yes |
| `codespell` | `codespell-project/actions-codespell` | All | Yes |
| `mypy_val` | Mypy | Integration | Yes |
| `structure_val` | bash theme directory check | Theme | Yes |

`mypy_val` also installs `.validate/requirements_test.txt` so HA types resolve.

### Version Pinning

**No tool version is recorded in this file or `README.md` — deliberately.** Every pip-installed tool (`zizmor`, `ruff`, `mypy`, `check-jsonschema`) and npm package (`prettier`) is pinned to an exact version inside `validate-specific.yaml`; **that file is the source of truth**. Duplicating the numbers here would just add a place to forget on every bump. To read a current version, grep the workflow:

```bash
grep -n "pip install \|npm install " .github/workflows/validate-specific.yaml
```

In the monorepo, these pins are audited against `dev-workbench/workbench/matrix/version_matrix.json` by `check_tool_drift.py`, which parses these workflow files directly — so a bump is caught by tooling, not by remembering to edit prose.

### Action Pinning Convention

All `uses:` references are pinned to a full SHA commit hash (not a tag). The human-readable version is recorded in a comment on the line above — either `# Tag @v7.0.1` (third-party actions) or `# Branch @main v2.0.2` (PlayFaster stubs referencing this repo). When updating an action, update both the SHA and the comment.

### Calling Repo `permissions`

The shared workflows declare `permissions: contents: read` at workflow level. All jobs in `validate-specific.yaml` have explicit job-level `permissions: contents: read`. **No validation job requires write access** — the Gist badge update in `test_val` uses `GIST_SECRET` (a PAT), not the GITHUB_TOKEN.

The one exception in this repo is outside validation: `codeql.yaml`'s `analyze` job needs `security-events: write` to upload its SARIF results (see **Other Workflows** below).

Integration stubs require no job-level permissions block — the workflow-level `permissions: contents: read` is sufficient. Theme stubs are the same.

**Integration:**

```yaml
jobs:
  validate:
    # Branch @main v2.0.2
    uses: PlayFaster/.github/.github/workflows/validate.yaml@<sha>
    with:
      category: integration
      component_name: wifi_ssid_monitor
      gist_id: <your-gist-id>
    secrets:
      GIST_SECRET: ${{ secrets.GIST_SECRET }}
```

**Theme:**

```yaml
jobs:
  validate:
    # Branch @main v2.0.3
    uses: PlayFaster/.github/.github/workflows/validate.yaml@<sha>
    with:
      category: theme
```

**Standard / Self-Validation:**

```yaml
jobs:
  validate:
    uses: PlayFaster/.github/.github/workflows/validate.yaml@<sha>
    with:
      category: standard
```

### `test_val` Dependencies

The test job installs from `.validate/requirements_test.txt` (in the calling repo) and runs `pip install .`. Coverage is measured against `custom_components/<component_name>/` and reported via a Gist-backed badge.

### `file_val` Config Files

The file integrity job reads schema and formatter config from `.validate/` in the calling repo:

- `.validate/hacs_schema.json` — HACS manifest schema (all projects)
- `.validate/ha_manifest_schema.json` — HA manifest schema (integration only)
- `.validate/.yamllint` — YAML lint rules
- `.validate/.prettierrc.json` — Prettier config (covers `*.md`, `*.json`, `*.yaml`, `*.yml`)
- `.validate/.mlc_config.json` — markdown-link-check config

### `codespell` Config

Both project types auto-discover codespell config from `pyproject.toml [tool.codespell]` in the calling repo root. No `path_to_config_file` is passed — the action uses pyproject.toml discovery automatically.

### `zizmor` Scope

Zizmor audits `.github/` in the calling repo with `--pedantic`. Blocking (`continue-on-error: false`).

## Other Workflows

Validation is not the only thing this repo ships. Two more files exist in `.github/workflows/`:

| Workflow | Trigger | Purpose |
| :-- | :-- | :-- |
| `codeql.yaml` | `workflow_call` | Reusable CodeQL analysis (Python) for integration repos. Each integration's own `codeql.yml` calls it. Its `analyze` job declares `security-events: write` — required to upload SARIF to GitHub Security, and the only write permission anywhere in this repo. |
| `validate-self.yaml` | `push` (main, dev), `pull_request`, weekly cron (Sun 00:00) | How this repo validates **itself**. Calls the local `./.github/workflows/validate.yaml` with `category: standard` — a local path, not a SHA-pinned external reference. Uses a `concurrency` group with `cancel-in-progress`. |

`codeql.yaml` is a genuinely separate entry point: it is **not** reached through `validate.yaml`, and the category input does not gate it.

## Local Development (Windows Host)

This repo has no devcontainer. Local validation runs on the Windows host via VS Code tasks.

### Setup (once after cloning)

Run the **Initial Setup** VS Code task, or manually:

```powershell
npm install   # installs prettier + prettier-plugin-sort-json into node_modules/
```

### Available Tasks

Run via **Terminal → Run Task** in VS Code:

| Task | What it does |
| :-- | :-- |
| `Initial Setup` | `npm install` — Prettier + sort-json plugin |
| **Validate All** | Runs all validate tasks in sequence |
| `Validate: Ruff Lint` | Ruff lint (exits cleanly on non-Python repos) |
| `Validate: Ruff Format Check` | Ruff format check |
| `Validate: Prettier Check` | Prettier check — md, json, yaml |
| `Validate: Markdown Style` | markdownlint check |
| `Validate: YAML Style` | yamllint check |
| `Validate: Codespell` | Spell check |
| `Validate: Zizmor` | GitHub Actions workflow security audit |
| `Validate: PSScriptAnalyzer` | PowerShell lint — config in `.validate/PSScriptAnalyzerSettings.psd1` |
| `Validate: Run Pytest` | pytest |
| `Validate: Pytest Coverage` | pytest with coverage report |
| **Format All** | Runs all `Format: Apply *` tasks in sequence |
| `Format: Apply Ruff Lint Fix` | `ruff check --fix` |
| `Format: Apply Ruff Format` | `ruff format` |
| `Format: Apply Prettier` | Prettier write |
| `Format: Apply Codespell` | `codespell -w` |
| `Format: Apply Markdownlint` | `markdownlint --fix` |
| `Format: Apply PSScriptAnalyzer` | PSScriptAnalyzer auto-fix |

Task output is written to `.reports/` (gitignored).

### Config Files

All tool configs live in `.validate/` and are managed by `sync_projects.ps1` in the monorepo root (`ha-dev-pf/`). Do not edit them directly here — edit the source in `dev-workbench/workbench/lint/` (or the appropriate subfolder) and re-run the sync script.

### Source

Tasks and configs are sourced from `dev-workbench/host-tooling/`. See `dev-workbench/host-tooling/what_this_is_for.md` for details.

## Dependabot

`dependabot.yml` monitors `github-actions`, `pip`, and `pre-commit` ecosystems weekly with a 7-day cool-down between updates.

## Shared Conventions

Markdown rules (the single-codepoint emoji ban for headings), temporary-file placement, and progress reporting are centralized — see [`.shared/dev_std/agent_conventions.md`](.shared/dev_std/agent_conventions.md) §5–7. Sections 1–4 of that file are integration-specific and do not apply to this repo, which has no devcontainer and no Python source.
