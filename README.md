# PlayFaster/.github

[![Latest Release](https://img.shields.io/github/v/release/PlayFaster/.github?label=Release&logo=github)](https://github.com/PlayFaster/.github/releases) [![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![Last Commit](https://img.shields.io/github/last-commit/PlayFaster/.github?label=Last%20commit)](https://github.com/PlayFaster/.github/commits/main)

Shared GitHub configuration for **PlayFaster Home Assistant integrations** — reusable workflows and Dependabot config consumed by all integration repos.

## 📋 Table of Contents

- [PlayFaster/.github](#playfastergithub)
  - [📋 Table of Contents](#-table-of-contents)
  - [🔧 Reusable Workflows](#-reusable-workflows)
  - [✅ Validation Jobs](#-validation-jobs)
  - [🔄 Dependabot](#-dependabot)
  - [📄 License](#-license)

## 🔧 Reusable Workflows

### `validate.yaml`

Runs the full validation suite for a Home Assistant custom integration. Called by each integration repo's own `validate.yaml` via `workflow_call`.

### **Inputs**

| Input | Required | Description |
| :-- | :-- | :-- |
| `component_name` | Yes | Component directory name (e.g., `wifi_ssid_monitor`) |
| `gist_id` | Yes | Gist ID for the dynamic coverage badge |

### **Secrets**

| Secret | Required | Description |
| :-- | :-- | :-- |
| `GIST_SECRET` | Yes | GitHub token with gist write access |

### **Usage**

Pin to a full commit SHA for immutability — tags can be moved, but a SHA is permanent. Record the corresponding branch and version in a comment:

```yaml
jobs:
  validate:
    permissions:
      contents: write # Required by test_val for coverage badge gist update
      pull-requests: write # Required by test_val for PR comments
    # Branch @main v1.0.8
    uses: PlayFaster/.github/.github/workflows/validate.yaml@ddb23280981992a44fbba00fe6a12ad41e502332
    with:
      component_name: wifi_ssid_monitor
      gist_id: <your-gist-id>
    secrets:
      GIST_SECRET: ${{ secrets.GIST_SECRET }}
```

> [!NOTE]
>
> The calling repo must supply a `.validate/` directory containing:
>
> - `requirements_test.txt` — test dependencies
> - `hacs_schema.json` and `ha_manifest_schema.json` — JSON schemas for the file integrity job
> - `.prettierrc.json` — Prettier config covering `*.md`, `*.json`, `*.yaml`, `*.yml`

## ✅ Validation Jobs

| Job | Tool | Blocking |
| :-- | :-- | :-- |
| `hassfest` | `home-assistant/actions/hassfest` | Yes |
| `hacs_val` | `hacs/action` | Yes |
| `py_val` | Ruff `0.15.15` | Yes |
| `test_val` | pytest + coverage badge (Gist) | Yes |
| `file_val` | check-jsonschema, yamllint, Prettier `3.6.2`, markdown-link-check | Yes |
| `codespell` | `codespell-project/actions-codespell` | Yes |
| `zizmor` | Zizmor `1.25.2` (workflow security audit) | No |
| `mypy_val` | Mypy `2.1.0` | No |

All `uses:` references are pinned to a full SHA. The human-readable tag is noted in a comment on the preceding line.

## 🔄 Dependabot

Monitors `github-actions`, `pip`, and `pre-commit` ecosystems on a **weekly** schedule with a 7-day cooldown between updates.

## 📄 License

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

This project is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.
