# PlayFaster/.github

[![Latest Release](https://img.shields.io/github/v/release/PlayFaster/.github?label=Release&logo=github)](https://github.com/PlayFaster/.github/releases) [![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![Last Commit](https://img.shields.io/github/last-commit/PlayFaster/.github?label=Last%20commit)](https://github.com/PlayFaster/.github/commits/main)

Shared GitHub configuration for **PlayFaster Home Assistant projects** — reusable workflows and Dependabot config consumed by all integration and theme repos.

## 📋 Table of Contents

- [PlayFaster/.github](#playfastergithub)
  - [📋 Table of Contents](#-table-of-contents)
  - [🔧 Reusable Workflows](#-reusable-workflows)
  - [✅ Validation Jobs](#-validation-jobs)
  - [🔄 Dependabot](#-dependabot)
  - [📄 License](#-license)

## 🔧 Reusable Workflows

### Architecture

Validation is split across two files:

- **`validate.yaml`** — master entry point called by every project stub. Accepts inputs and delegates to `validate-specific.yaml`.
- **`validate-specific.yaml`** — contains all 9 jobs. The `category` input controls which jobs run per project type.

Project stubs always call `validate.yaml` — the internal split is invisible to callers.

### **Inputs**

| Input | Required | Default | Description |
| :-- | :-- | :-- | :-- |
| `category` | No | `integration` | Project type: `integration`, `theme`, or `standard` |
| `component_name` | No | `""` | Component directory name (e.g., `wifi_ssid_monitor`) — integration only |
| `gist_id` | No | `""` | Gist ID for the dynamic coverage badge — integration only |

### **Secrets**

| Secret        | Required | Description                                            |
| :------------ | :------- | :----------------------------------------------------- |
| `GIST_SECRET` | No       | GitHub token with gist write access — integration only |

Integration stubs pass `GIST_SECRET` explicitly. Theme stubs pass no secrets.

### **Usage — Integration**

Pin to a full commit SHA for immutability — tags can be moved, but a SHA is permanent. Record the corresponding branch and version in a comment:

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

### **Usage — Theme**

```yaml
jobs:
  validate:
    # Branch @main v2.0.3
    uses: PlayFaster/.github/.github/workflows/validate.yaml@<sha>
    with:
      category: theme
```

### **Usage — Standard (Self-Validation)**

Used for basic validation of non-Home-Assistant repositories (such as the `.github` repository itself):

```yaml
jobs:
  validate:
    uses: PlayFaster/.github/.github/workflows/validate.yaml@<sha>
    with:
      category: standard
```

> [!NOTE]
>
> For integration and theme categories, the calling repo must supply a `.validate/` directory containing:
>
> - `hacs_schema.json` and `ha_manifest_schema.json` — JSON schemas for the file integrity job
> - `.yamllint` — YAML lint rules
> - `.prettierrc.json` — Prettier config covering `*.md`, `*.json`, `*.yaml`, `*.yml`
> - `.mlc_config.json` — markdown-link-check config
>
> Integration repos also need `requirements_test.txt` and a root `pyproject.toml` with `[tool.codespell]`. Theme repos need a root `pyproject.toml` with `[tool.codespell]`.

## ✅ Validation Jobs

| Job | Tool | Category | Blocking |
| :-- | :-- | :-- | :-- |
| `zizmor` | Zizmor `1.25.2` (workflow security audit) | All | Yes |
| `hassfest` | `home-assistant/actions/hassfest` | Integration | Yes |
| `hacs_val` | `hacs/action` (category passed through) | Integration, Theme | Yes |
| `py_val` | Ruff `0.15.16` | Integration | Yes |
| `test_val` | pytest + coverage badge (Gist) | Integration | Yes |
| `file_val` | check-jsonschema, yamllint, Prettier `3.6.2`, markdown-link-check | All (HACS/HA schema checks skipped for standard) | Yes |
| `codespell` | `codespell-project/actions-codespell` | All | Yes |
| `mypy_val` | Mypy `2.1.0` | Integration | Yes |
| `structure_val` | Theme directory structure check | Theme | Yes |

All `uses:` references are pinned to a full SHA. The human-readable tag is noted in a comment on the preceding line.

## 🔄 Dependabot

Monitors `github-actions`, `pip`, and `pre-commit` ecosystems on a **weekly** schedule with a 7-day cooldown between updates.

## 📄 License

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

This project is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.
