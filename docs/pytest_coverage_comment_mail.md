# pytest-coverage-comment (MishaKav) — Removed in v2.0.2

## What it did

`MishaKav/pytest-coverage-comment` posted a formatted test coverage report as a comment on every PR and push commit. It consumed `coverage.xml` and `pytest.xml` generated during the test run and rendered a table showing per-file coverage alongside a summary badge. On push events it created a commit comment; on pull request events it created or updated a PR comment.

A side effect of the commit/PR comment was that GitHub sent an email notification to repository watchers after every CI run.

## Why it was removed

On push events (e.g. merges to `main`) the action creates a **commit comment**, which requires `contents: write` on the GITHUB_TOKEN. This permission needed to flow through the entire call chain:

```text
project stub → validate.yaml → validate-specific.yaml → test_val job
```

This drove `pull-requests: write` and `contents: write` into every integration stub and into the shared workflow's `specific` job, complicating the permissions model and causing a hard failure (`Resource not accessible by integration`) when any link in that chain had the permission missing or capped.

The Gist-backed README badge (`schneegans/dynamic-badges-action`) is independent — it uses `GIST_SECRET` (a PAT) and needs no elevated GITHUB_TOKEN permissions. Removing `MishaKav/pytest-coverage-comment` allowed all jobs to operate at `contents: read` only, eliminating the permissions complexity entirely.

The `--cov-report=xml` and `--junitxml=pytest.xml` pytest flags were also removed — they existed solely to produce the files consumed by this action.

## How to re-enable

Re-adding the action requires three coordinated changes:

### 1. Restore pytest flags in `validate-specific.yaml`

```yaml
- name: Run tests
  run: |
    pytest --cov="$COMPONENT_PATH" \
      --cov-report=xml \
      --cov-report=term-missing \
      --junitxml=pytest.xml \
      tests/
```

### 2. Re-add the action step (after Run tests, before Extract Coverage Percentage)

```yaml
- name: Pytest coverage comment
  id: coverageComment
  # Branch @main — pin to a SHA
  uses: MishaKav/pytest-coverage-comment@<sha>
  with:
    pytest-xml-coverage-path: ./coverage.xml
    title: Coverage Report
    badge-title: Coverage
    hide-badge: false
    hide-comment: false
    create-new-comment: false
    junitxml-path: ./pytest.xml
```

### 3. Restore permissions through the chain

In `validate-specific.yaml` — `test_val` job:

```yaml
test_val:
  permissions:
    contents: read
    pull-requests: write # pytest-coverage-comment posts PR/commit comments
```

In `validate.yaml` — `specific` job:

```yaml
specific:
  permissions:
    contents: read
    pull-requests: write
```

In every integration stub — `validate` job:

```yaml
validate:
  permissions:
    contents: write      # commit comments on push events
    pull-requests: write # PR comments
```

## Note on commit comment emails

The push-event commit comment is what generates the email notifications. If only PR comments are wanted (no emails on direct pushes), the action can be conditioned to run on `pull_request` events only:

```yaml
- name: Pytest coverage comment
  if: github.event_name == 'pull_request'
  uses: MishaKav/pytest-coverage-comment@<sha>
  ...
```

This would also mean `contents: write` is no longer needed (PR comments use `pull-requests: write` only), simplifying the stub permissions back to `pull-requests: write` only.
