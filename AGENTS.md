# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## Purpose

This is the `PlayFaster/.github` shared repository — it holds reusable GitHub Actions workflows consumed by all PlayFaster Home Assistant integration repos via `workflow_call`.

## Workflow Architecture

### `validate.yaml` — Shared Reusable Workflow

The single workflow at `.github/workflows/validate.yaml` is the entire deliverable. Each integration repo calls it with two inputs:

- `component_name` — the `custom_components/` subdirectory name (e.g., `wifi_ssid_monitor`)
- `gist_id` — Gist ID for the dynamic coverage badge

And one secret: `GIST_SECRET` (GitHub token with gist write access).

### Job Summary

| Job | Tool / Version | Blocking |
| --- | --- | --- |
| `hassfest` | `home-assistant/actions/hassfest` | Yes |
| `hacs_val` | `hacs/action` | Yes |
| `py_val` | Ruff `0.15.15` | Yes |
| `test_val` | pytest + `MishaKav/pytest-coverage-comment` + `schneegans/dynamic-badges-action` | Yes |
| `file_val` | `check-jsonschema`, `ibiqlik/action-yamllint`, Prettier `3.6.2`, `gaurav-nelson/github-action-markdown-link-check` | Yes |
| `codespell` | `codespell-project/actions-codespell` | Yes |
| `zizmor` | Zizmor `1.25.2` | No |
| `mypy_val` | Mypy `2.1.0` | No |

### Action Pinning Convention

All `uses:` references are pinned to a full SHA commit hash (not a tag). The branch and version are recorded in a comment on the line above (e.g., `# Branch @main v1.0.8`). When updating an action, update both the SHA and the comment.

### Calling Repo `permissions`

The calling job must declare elevated permissions — `test_val` needs them to update the Gist badge and post PR comments:

```yaml
jobs:
  validate:
    permissions:
      contents: write # Required by test_val for coverage badge gist update
      pull-requests: write # Required by test_val for PR comments
    # Branch @main v1.0.8
    uses: PlayFaster/.github/.github/workflows/validate.yaml@<sha>
```

### `test_val` Dependencies

The test job installs from `.validate/requirements_test.txt` (in the calling repo) and runs `pip install .`. Coverage is measured against `custom_components/<component_name>/` and reported via PR comment and a Gist-backed badge.

### `file_val` Config Files

The file integrity job reads schema and formatter config from `.validate/` in the calling repo:

- `.validate/hacs_schema.json` — HACS manifest schema
- `.validate/ha_manifest_schema.json` — HA manifest schema
- `.validate/.prettierrc.json` — Prettier config (covers `*.md`, `*.json`, `*.yaml`, `*.yml`)

### `zizmor` Scope

Zizmor audits `.github/` in the calling repo with `--pedantic`. It runs `continue-on-error: false` but is non-blocking at the suite level — known findings exist pending resolution.

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
