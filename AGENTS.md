# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## Purpose

This is the `PlayFaster/.github` shared repository — it holds reusable GitHub Actions workflows consumed by all PlayFaster Home Assistant projects (integrations and the theme) via `workflow_call`.

## Workflow Architecture

### Two-File Split

Validation is split across two files:

- **`validate.yaml`** — master entry point. Called by every project stub. Accepts all inputs and delegates immediately to `validate-specific.yaml` via `secrets: inherit`.
- **`validate-specific.yaml`** — contains all 9 jobs. A `category` input (`integration` or `theme`) gates which jobs run.

Project stubs always call `validate.yaml`. The internal split is invisible to callers.

### Inputs

| Input | Required | Default | Description |
| :-- | :-- | :-- | :-- |
| `category` | No | `integration` | Project type: `integration` or `theme` |
| `component_name` | No | `""` | `custom_components/` subdirectory name (integration only) |
| `gist_id` | No | `""` | Gist ID for the dynamic coverage badge (integration only) |

### Secrets

`GIST_SECRET` (GitHub token with gist write access) — optional, required only for integration projects running `test_val`. Pass via `secrets: inherit` from the calling stub.

### Job Summary

| Job | Tool / Version | Category | Blocking |
| :-- | :-- | :-- | :-- |
| `zizmor` | Zizmor `1.25.2` | All | Yes |
| `hassfest` | `home-assistant/actions/hassfest` | Integration | Yes |
| `hacs_val` | `hacs/action` (category passed through) | All | Yes |
| `py_val` | Ruff `0.15.16` | Integration | Yes |
| `test_val` | pytest + `MishaKav/pytest-coverage-comment` + `schneegans/dynamic-badges-action` | Integration | Yes |
| `file_val` | `check-jsonschema`, `ibiqlik/action-yamllint`, Prettier `3.6.2`, `gaurav-nelson/github-action-markdown-link-check` | All | Yes |
| `codespell` | `codespell-project/actions-codespell` | All | Yes |
| `mypy_val` | Mypy `2.1.0` | Integration | Yes |
| `structure_val` | bash theme directory check | Theme | Yes |

### Action Pinning Convention

All `uses:` references are pinned to a full SHA commit hash (not a tag). The branch and version are recorded in a comment on the line above (e.g., `# Branch @main v2.0.0`). When updating an action, update both the SHA and the comment.

### Calling Repo `permissions`

Integration stubs must declare elevated permissions — `test_val` needs them to update the Gist badge and post PR comments. Theme stubs need only `contents: read`.

**Integration:**

```yaml
jobs:
  validate:
    permissions:
      contents: write # Required by test_val for coverage badge gist update
      pull-requests: write # Required by test_val for PR comments
    # Branch @main v2.0.0
    uses: PlayFaster/.github/.github/workflows/validate.yaml@<sha>
    with:
      category: integration
      component_name: wifi_ssid_monitor
      gist_id: <your-gist-id>
    secrets: inherit
```

**Theme:**

```yaml
jobs:
  validate:
    # Branch @main v2.0.0
    uses: PlayFaster/.github/.github/workflows/validate.yaml@<sha>
    with:
      category: theme
    secrets: inherit
```

### `test_val` Dependencies

The test job installs from `.validate/requirements_test.txt` (in the calling repo) and runs `pip install .`. Coverage is measured against `custom_components/<component_name>/` and reported via PR comment and a Gist-backed badge.

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

## Local Development (Windows Host)

This repo has no devcontainer. Local validation runs on the Windows host via VS Code tasks.

### Setup (once after cloning)

Run the **Initial Setup** VS Code task, or manually:

```powershell
npm install   # installs prettier + prettier-plugin-sort-json into node_modules/
```

### Available Tasks

Run via **Terminal → Run Task** in VS Code:

| Task                          | What it does                                  |
| :---------------------------- | :-------------------------------------------- |
| **Validate All**              | Runs all validate tasks in sequence           |
| `Validate: Ruff Lint`         | Ruff lint (exits cleanly on non-Python repos) |
| `Validate: Ruff Format Check` | Ruff format check                             |
| `Validate: Prettier Check`    | Prettier check — md, json, yaml               |
| `Validate: Markdown Style`    | markdownlint check                            |
| `Validate: YAML Style`        | yamllint check                                |
| `Validate: Codespell`         | Spell check                                   |
| **Format All**                | Runs all format/fix tasks in sequence         |

### Config Files

All tool configs live in `.validate/` and are managed by `sync_projects.ps1` in the monorepo root (`home-assistant/`). Do not edit them directly here — edit the source in `shared/SharedNotes/validate-configs/` and re-run the sync script.

### Source

Tasks and configs are sourced from `shared/SharedNotes/validate-configs/host-tooling/`. See `host-tooling/what_this_is_for.md` for details.

## Dependabot

`dependabot.yml` monitors `github-actions`, `pip`, and `pre-commit` ecosystems weekly with a 7-day cooldown between updates.
