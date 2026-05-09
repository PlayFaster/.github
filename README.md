# PlayFaster/.github

Shared GitHub configuration for PlayFaster Home Assistant integrations.

## Reusable Workflows

### `validate.yaml`

Runs the full validation suite for a Home Assistant custom integration. Called by each
integration repo's own `validate.yaml` via `workflow_call`.

**Inputs**

| Input            | Required | Description                                          |
| ---------------- | -------- | ---------------------------------------------------- |
| `component_name` | Yes      | Component directory name (e.g., `wifi_ssid_monitor`) |
| `gist_id`        | Yes      | Gist ID for the dynamic coverage badge               |

**Secrets**

| Secret        | Required | Description                         |
| ------------- | -------- | ----------------------------------- |
| `GIST_SECRET` | Yes      | GitHub token with gist write access |

**Usage**

```yaml
jobs:
  validate:
    uses: PlayFaster/.github/.github/workflows/validate.yaml@main
    with:
      component_name: wifi_ssid_monitor
      gist_id: <your-gist-id>
    secrets:
      GIST_SECRET: ${{ secrets.GIST_SECRET }}
```

## Jobs

| Job          | Name                    | Blocking |
| ------------ | ----------------------- | -------- |
| `hassfest`   | HA Hassfest             | Yes      |
| `hacs_val`   | HACS Check              | Yes      |
| `py_val`     | Python Lint (Ruff)      | Yes      |
| `test_val`   | Tests & Coverage        | Yes      |
| `file_val`   | File Integrity          | Yes      |
| `codespell`  | Codespell               | Yes      |
| `zizmor`     | Zizmor (Workflow Audit) | No       |
| `mypy_val`   | Python Types (Mypy)     | No       |
