# Internal Detailed Changelog: .github Repo

All changes to this project will be documented in this file. This is the detailed changelog, to include non user facing changes and intra-release changes.

---

- [Internal Detailed Changelog: .github Repo](#internal-detailed-changelog-github-repo)
  - [\[2.0.10-dev2\] - 2026-08-06 - Tasks.json; .gitignore](#2010-dev2---2026-08-06---tasksjson-gitignore)
  - [\[2.0.10-dev1\] - 2026-08-04 - Local CI Sync Add Do Not Edit Comments](#2010-dev1---2026-08-04---local-ci-sync-add-do-not-edit-comments)
  - [\[2.0.9\] - 2026-08-02 - Release - Changelog ToC Dependabot Bumps CodeQL Python HASSFest](#209---2026-08-02---release---changelog-toc-dependabot-bumps-codeql-python-hassfest)
  - [\[2.0.9-dev2\] - 2026-08-02 - Dependabot Bumps to CodeQL Python HASSFest](#209-dev2---2026-08-02---dependabot-bumps-to-codeql-python-hassfest)
  - [\[2.0.9-dev1\] - 2026-08-02 - Changelog_Local Table of Contents](#209-dev1---2026-08-02---changelog_local-table-of-contents)
  - [\[2.0.8\] - 2026-08-01 - Release - Docs CI Bumps Ruff Zizmor](#208---2026-08-01---release---docs-ci-bumps-ruff-zizmor)
  - [\[2.0.8-dev3\] - 2026-07-30 - CI Bump Ruff Zizmor](#208-dev3---2026-07-30---ci-bump-ruff-zizmor)
  - [\[2.0.8-dev2\] - 2026-07-26 - CI Bump Ruff](#208-dev2---2026-07-26---ci-bump-ruff)
  - [\[2.0.8-dev1\] - 2026-07-26 - Docs README and AGENTS](#208-dev1---2026-07-26---docs-readme-and-agents)
  - [\[2.0.7\] - 2026-07-26 - Release - Sync Docs CI Bumps](#207---2026-07-26---release---sync-docs-ci-bumps)
  - [\[2.0.7-dev6\] - 2026-07-26 - Dependabot Bumps](#207-dev6---2026-07-26---dependabot-bumps)
  - [\[2.0.7-dev5\] - 2026-07-23 - No Complex Emoji](#207-dev5---2026-07-23---no-complex-emoji)
  - [\[2.0.7-dev4\] - 2026-07-17 - CI Bump Ruff](#207-dev4---2026-07-17---ci-bump-ruff)
  - [\[2.0.7-dev2\] - 2026-07-12 - Dependabot Bump CodeQL](#207-dev2---2026-07-12---dependabot-bump-codeql)
  - [\[2.0.7-dev1\] - 2026-07-09 - Sync Updated](#207-dev1---2026-07-09---sync-updated)
  - [\[2.0.6\] - 2026-07-06 - Ruff Checks Extended CI Bumps](#206---2026-07-06---ruff-checks-extended-ci-bumps)
  - [\[2.0.6-dev3\] - 2026-07-06 - Ruff Checks Extended](#206-dev3---2026-07-06---ruff-checks-extended)
  - [\[2.0.6-dev2\] - 2026-07-03 - CI Bump](#206-dev2---2026-07-03---ci-bump)
  - [\[2.0.6-dev1\] - 2026-07-02 - CI Bump](#206-dev1---2026-07-02---ci-bump)
  - [\[2.0.5\] - 2026-07-02 - YAMLLint Zizmor Docs CI Bumps](#205---2026-07-02---yamllint-zizmor-docs-ci-bumps)
  - [\[2.0.5-dev6\] - 2026-07-02 - CI Bumps](#205-dev6---2026-07-02---ci-bumps)
  - [\[2.0.5-dev5\] - 2026-06-29 - CI Bump](#205-dev5---2026-06-29---ci-bump)
  - [\[2.0.5-dev4\] - 2026-06-27 - YAML Lint](#205-dev4---2026-06-27---yaml-lint)
  - [\[2.0.5-dev3\] - 2026-06-22 - Zizmor ignore adhoc-packages CI Bump](#205-dev3---2026-06-22---zizmor-ignore-adhoc-packages-ci-bump)
  - [\[2.0.5-dev2\] - 2026-06-22 - Docs README AGENTS](#205-dev2---2026-06-22---docs-readme-agents)
  - [\[2.0.5-dev1\] - 2026-06-22 - gitignore](#205-dev1---2026-06-22---gitignore)
  - [\[2.0.4\] - 2026-06-20 - Validate-Self CI Bumps](#204---2026-06-20---validate-self-ci-bumps)
  - [\[2.0.4-dev5\] - 2026-06-20 - Validate-Self](#204-dev5---2026-06-20---validate-self)
  - [\[2.0.4-dev4\] - 2026-06-20 - CI Bump](#204-dev4---2026-06-20---ci-bump)
  - [\[2.0.4-dev3\] - 2026-06-18 - Host Tooling Alignment](#204-dev3---2026-06-18---host-tooling-alignment)
  - [\[2.0.4-dev2\] - 2026-06-15 - Tasks.json Color Coding](#204-dev2---2026-06-15---tasksjson-color-coding)
  - [\[2.0.4-dev1\] - 2026-06-15 - Documentation](#204-dev1---2026-06-15---documentation)
  - [\[2.0.3\] - 2026-06-15 - Coverage Report (old) Removed Permissions Simplified](#203---2026-06-15---coverage-report-old-removed-permissions-simplified)
  - [\[2.0.2\] - 2026-06-15 - Local Zizmor and Permissions](#202---2026-06-15---local-zizmor-and-permissions)
  - [\[2.0.1\] - 2026-06-15 - Gist Secrets Permissions](#201---2026-06-15---gist-secrets-permissions)
  - [\[2.0.0\] - 2026-06-15 - Validate Specific Separated Theme Support All Checks Blocking](#200---2026-06-15---validate-specific-separated-theme-support-all-checks-blocking)
  - [\[1.1.4-dev2\] - 2026-06-15 - Formatting](#114-dev2---2026-06-15---formatting)
  - [\[1.1.4-dev1\] - 2026-06-15 - Local Validation](#114-dev1---2026-06-15---local-validation)
  - [\[1.1.3\] - 2026-06-14 - CodeQL Permissions](#113---2026-06-14---codeql-permissions)
  - [\[1.1.2\] - 2026-06-14 - Shared CodeQL](#112---2026-06-14---shared-codeql)
  - [\[1.1.1\] - 2026-06-14 - Validation Config](#111---2026-06-14---validation-config)
  - [\[1.1.0\] - 2026-06-14 - Validation Config and Link Check](#110---2026-06-14---validation-config-and-link-check)
  - [\[1.0.9\] - 2026-06-14 - Docs gitignore License CI Bumps](#109---2026-06-14---docs-gitignore-license-ci-bumps)
  - [\[1.0.9-dev2\] - 2026-06-13 - CI Bump](#109-dev2---2026-06-13---ci-bump)
  - [\[1.0.9-dev1\] - 2026-06-12 - Docs gitignore](#109-dev1---2026-06-12---docs-gitignore)
  - [\[1.0.8\] - 2026-06-11 - CI Bump Hassfest](#108---2026-06-11---ci-bump-hassfest)
  - [\[1.0.7\] - 2026-06-10 - CI Bump Hassfest](#107---2026-06-10---ci-bump-hassfest)
  - [\[1.0.6\] - 2026-06-10 - CI Bump Ruff](#106---2026-06-10---ci-bump-ruff)
  - [\[1.0.5\] - 2026-05-27 - CI Pins](#105---2026-05-27---ci-pins)
  - [\[1.0.4\] - 2026-05-24 - CI Bump Zizmor](#104---2026-05-24---ci-bump-zizmor)
  - [\[1.0.3\] - 2026-05-24 - Continue on Error OFF CI Bumps](#103---2026-05-24---continue-on-error-off-ci-bumps)
  - [\[1.0.2\] - 2026-05-09- From Tags to SHA Hashes](#102---2026-05-09--from-tags-to-sha-hashes)
  - [\[1.0.1\] - 2026-05-09 - Initial Release](#101---2026-05-09---initial-release)

---

## [2.0.10-dev2] - 2026-08-06 - Tasks.json; .gitignore

### Changed

- **Local CI**: These changes do not directly impact this repo but are shared/sync changes.
  - `.gitignore`: Updated to add `mutants/`for `mutmut` testing.
  - `tasks.json`: Updated to include branch coverage for `pytest` coverage.

## [2.0.10-dev1] - 2026-08-04 - Local CI Sync Add Do Not Edit Comments

### Changed

- **Local CI**: These changes do not directly impact this repo but are shared/sync changes.
  - Local CI sync for `.validate\pyproject_common.toml` to add in-line comments to prevent local editing of sync shared files.
  - Updated with latest HA `ruff` inclusions and exclusions.

## [2.0.9] - 2026-08-02 - Release - Changelog ToC Dependabot Bumps CodeQL Python HASSFest

### Dependabot Bumps

- Bump github/codeql-action/analyze from 4.37.1 to 4.37.3 - #48
- Bump home-assistant/actions/hassfest from e3fb68ebda13d88a0d695082f471ba2c83d025fb to ab22029681aa532bfe7de5774a9972d67bfbd2c0 - #47
- Bump github/codeql-action/init from 4.37.1 to 4.37.3 - #46
- Bump actions/setup-python from 6.3.0 to 7.0.0 - #45

### Changed

- **`changelog_local` ToC**: Added table of contents to `changelog_local` (top-of-file) and to the end of `CHANGELOG` and updated release headers in `changelog_local` for readability.

## [2.0.9-dev2] - 2026-08-02 - Dependabot Bumps to CodeQL Python HASSFest

### Dependabot Bumps

- Bump github/codeql-action/analyze from 4.37.1 to 4.37.3 - #48
- Bump home-assistant/actions/hassfest from e3fb68ebda13d88a0d695082f471ba2c83d025fb to ab22029681aa532bfe7de5774a9972d67bfbd2c0 - #47
- Bump github/codeql-action/init from 4.37.1 to 4.37.3 - #46
- Bump actions/setup-python from 6.3.0 to 7.0.0 - #45

## [2.0.9-dev1] - 2026-08-02 - Changelog_Local Table of Contents

### Changed

- **`changelog_local` ToC**: Added table of contents to `changelog_local` (top-of-file) and to the end of `CHANGELOG` and updated release headers in `changelog_local` for readability.

## [2.0.8] - 2026-08-01 - Release - Docs CI Bumps Ruff Zizmor

### Bumps

- **Validate Bump**: Update `ruff` from 0.15.21 to 0.16.0
- **Validate Bump**: Update `zizmor` from 1.25.2 to 1.28.0

### Changed

- **Docs**: Updated README.md and AGENTS.md to bring them into sync and remove reference to inactive projects.

## [2.0.8-dev3] - 2026-07-30 - CI Bump Ruff Zizmor

### Bumps

- **Validate Bump**: Update `ruff` from 0.15.22 to 0.16.0
  - Requires release. Ruff is now passing locally and failing on github because of the mismatch.
- **Validate Bump**: Update `zizmor` from 1.25.2 to 1.28.0

## [2.0.8-dev2] - 2026-07-26 - CI Bump Ruff

### Bumps

- **Validate Bump**: Update `ruff` from 0.15.21 to 0.15.22

## [2.0.8-dev1] - 2026-07-26 - Docs README and AGENTS

### Changed

- **Docs**: Updated README.md and AGENTS.md to bring them into sync and remove reference to inactive projects.

---

## [2.0.7] - 2026-07-26 - Release - Sync Docs CI Bumps

### Changed

- **Docs**: Updated AGENTS.md to clarify the complex two-character emojis should not be used in README or similar files as it can cause issues with markdown lint and github link formatting.
- **Sync Updated**: Updated (refactored) the Shared CI sync script and added PowerShell Linting. NO effect on this repo, but did push files.

### Bumps

- **#42**: Bump home-assistant/actions/hassfest from f4ca6f671bd429efb108c0f2fa0ae8af0215986c to e3fb68ebda13d88a0d695082f471ba2c83d025fb
- **#41**: Bump actions/checkout from 7.0.0 to 7.0.1
- **#40**: Bump github/codeql-action/analyze from 4.36.2 to 4.37.1
- **#39**: Bump github/codeql-action/init from 4.36.2 to 4.37.1
- **#36**: Bump schneegans/dynamic-badges-action from 1.8.0 to 1.9.0
- **Validate Bump**: Update Ruff from 0.15.20 to 0.15.21
- **Dependabot**: Bump CodeQL from 4.36.2 to 4.36.3 (PR #34 #35)

## [2.0.7-dev6] - 2026-07-26 - Dependabot Bumps

### Bumps

- **#42**: Bump home-assistant/actions/hassfest from f4ca6f671bd429efb108c0f2fa0ae8af0215986c to e3fb68ebda13d88a0d695082f471ba2c83d025fb
- **#41**: Bump actions/checkout from 7.0.0 to 7.0.1
- **#40**: Bump github/codeql-action/analyze from 4.36.2 to 4.37.1
- **#39**: Bump github/codeql-action/init from 4.36.2 to 4.37.1
- **#36**: Bump schneegans/dynamic-badges-action from 1.8.0 to 1.9.0

## [2.0.7-dev5] - 2026-07-23 - No Complex Emoji

### Changed

- **Docs**: Updated AGENTS.md to clarify the complex two-character emojis should not be used in README or similar files as it can cause issues with markdown lint and github link formatting.

## [2.0.7-dev4] - 2026-07-17 - CI Bump Ruff

### Bumps

- **Validate Bump**: Update Ruff from 0.15.20 to 0.15.21

## [2.0.7-dev2] - 2026-07-12 - Dependabot Bump CodeQL

### Bumps

- **Dependabot**: Bump CodeQL from 4.36.2 to 4.36.3 (PR #34 #35)

## [2.0.7-dev1] - 2026-07-09 - Sync Updated

### Changed

- **Sync Updated**: Updated (refactored) the Shared CI sync script and added PowerShell Linting. NO effect on this repo, but did push files.

## [2.0.6] - 2026-07-06 - Ruff Checks Extended CI Bumps

### Changed

- **Ruff Checks Extended**: As of shared CI Dev-workbench v2.2.1, Ruff checks have been extended to align with Home Assistant. This involves INcluding a wide range of checks and then EXcluding several items because of the wider range.

### Bumps

- **Validate Bump**: Update Ruff from 0.15.19 to 0.15.20
- **Dependabot Bump**: Bump Setup-Python via SHA from v6.2.0 to v6.3.0 (PR #6)

## [2.0.6-dev3] - 2026-07-06 - Ruff Checks Extended

### Changed

- **Ruff Checks Extended**: As of shared CI Dev-workbench v2.2.1, Ruff checks have been extended to align with Home Assistant. This involves INcluding a wide range of checks and then EXcluding several items because of the wider range.

## [2.0.6-dev2] - 2026-07-03 - CI Bump

### Bumps

- **Validate Bump**: Update Ruff from 0.15.19 to 0.15.20

## [2.0.6-dev1] - 2026-07-02 - CI Bump

### Bumps

- **Dependabot Bump**: Bump Setup-Python via SHA from v6.2.0 to v6.3.0 (PR #6)

## [2.0.5] - 2026-07-02 - YAMLLint Zizmor Docs CI Bumps

### Changed

- **YAML Lint**: Added "document-start: disable" to .yamllint rule file, to stop warns/fails for "no --- at document start", which brings it in line with Home Assistant.
- **YAML Files**: Updated YAML files to remove any "---" document starts added.
- **Doc Update**: Updated README and AGENTS with note on the self-validation
- **gitignore**: Updated .gitignore file (scratch folder)

### Bumps

- **Validate Bump**: Bumped Ruff from 0.15.16 to 0.15.19
- **Validate Bump**: Bumped check-jsonschema from 0.37.2 to 0.37.4
- **Dependabot Bump**: Bump HASSfest Master via SHA (PR #29)
- **Dependabot Bump**: Bump Checkout from v4.3.1 to v7.0.0 via SHA (PR #30)
- **Dependabot Bump**: Bump Setup-Python via SHA from v5.6.0 to v6.2.0 (PR #6)

### Added

- **zizmor ignore adhoc-packages**: Added "# zizmor: ignore[adhoc-packages]" to .github/workflows/validate-specific.yaml to ignore low risk Zizmor issue "ad-hoc installation of packages / installs a package outside of a lockfile", flagged for "npm install prettier@3.6.2 prettier-plugin-sort-json@4.2.0". Explored other options, but to change this to an action with a pinned SHA would work for Prettier but not for prettier-plugin-sort-json which is Home Assistant specific.

## [2.0.5-dev6] - 2026-07-02 - CI Bumps

### Changed

- **Validate Bump**: Bumped Ruff from 0.15.18 to 0.15.19
- **Validate Bump**: Bumped check-jsonschema from 0.37.2 to 0.37.4

## [2.0.5-dev5] - 2026-06-29 - CI Bump

### Changed

- **Validate Bump**: Bumped Ruff from 0.15.17 to 0.15.18

## [2.0.5-dev4] - 2026-06-27 - YAML Lint

### Summary

- **All about YAML Lint**: Multiple YAML Lint local validation warns/fails in the ha-dev-pf stub repo highlighted some shortcomings with YAML Lint implementation. Updated to avoid need for "---" at the top of every YAML file, which is a YAML standard, but NOT the HA standard. Also updated to only run on git tracked files (avoids linting devcon files for example).

### Changed

- **YAML Lint**: Added "document-start: disable" to .yamllint rule file, to stop warns/fails for "no --- at document start", which brings it in line with Home Assistant.
- **YAML Files**: Updated YAML files to remove any "---" document starts added.
- **Tasks.json**: Updated tasks.json, via hosts-tooling so that YAML-Lint only runs on git tracked files.

## [2.0.5-dev3] - 2026-06-22 - Zizmor ignore adhoc-packages CI Bump

### Added

- **zizmor ignore adhoc-packages**: Added "# zizmor: ignore[adhoc-packages]" to .github/workflows/validate-specific.yaml to ignore low risk Zizmor issue "ad-hoc installation of packages / installs a package outside of a lockfile", flagged for "npm install prettier@3.6.2 prettier-plugin-sort-json@4.2.0". Explored other options, but to change this to an action with a pinned SHA would work for Prettier but not for prettier-plugin-sort-json which is Home Assistant specific.

### Changed

- **Bump**: Bumped Ruff from 0.15.16 to 0.15.17

## [2.0.5-dev2] - 2026-06-22 - Docs README AGENTS

### Changed

- **Doc Update**: Updated README and AGENTS with note on the self-validation

## [2.0.5-dev1] - 2026-06-22 - gitignore

### Changed

- **gitignore**: Updated .gitignore file (scratch folder)

## [2.0.4] - 2026-06-20 - Validate-Self CI Bumps

### Added

- **Validate-Self**: Added a Standard validation category for basic validation, and validate-self.yaml to run this internally on this repo.

### Changed

- **Dependabot**: Bump CodeQL from 3.36.2 to 4.36.2 (PR #27)

## [2.0.4-dev5] - 2026-06-20 - Validate-Self

### Added

- **Validate-Self**: Added a Standard validation category for basic validation, and validate-self.yaml to run this internally on this repo.

## [2.0.4-dev4] - 2026-06-20 - CI Bump

### Changed

- **Dependabot**: Bump CodeQL from 3.36.2 to 4.36.2 (PR #27)

## [2.0.4-dev3] - 2026-06-18 - Host Tooling Alignment

### Changed

- **Host Tooling Alignment**: Updated the Host Tooling alignment/sync, removed per repo differences.

## [2.0.4-dev2] - 2026-06-15 - Tasks.json Color Coding

### Added

- **Tasks.json Color Coding**: Improved local CI tasks.json with color coded output for Validate tasks e.g. "Passed" in Green.

## [2.0.4-dev1] - 2026-06-15 - Documentation

### Changed

- **Documentation**: Updated doc files.

## [2.0.3] - 2026-06-15 - Coverage Report (old) Removed Permissions Simplified

### Changed

- **Permissions simplified**: Removing `MishaKav/pytest-coverage-comment` eliminated the need for `pull-requests: write` across the entire call chain. `test_val` now declares only `contents: read`. The `specific` job in `validate.yaml` likewise reverts to `contents: read` only. All 5 integration stubs no longer need a job-level permissions block — the workflow-level `permissions: contents: read` is sufficient.

### Removed

- **Coverage Report**: Removed the coverage report as it required extra permissions and is separate to the coverage badge, which is what is really required.
- **`MishaKav/pytest-coverage-comment`**: Removed from `test_val`. This action posted a formatted coverage report as a PR/commit comment using the GITHUB_TOKEN, requiring `pull-requests: write` through the entire call chain and generating commit comment emails on push events. The Gist-backed README badge (`schneegans/dynamic-badges-action`) is unaffected and continues to work. See `docs/pytest_coverage_comment_mail.md` for re-enablement details.
- **`--cov-report=xml` and `--junitxml=pytest.xml`** from the pytest command — these flags only existed to feed `pytest-coverage-comment`.

## [2.0.2] - 2026-06-15 - Local Zizmor and Permissions

### Added

- **Local Zizmor**: Added local Zizmor audit which flagged several issues requiring permissions changes or clarifications.

### Changed

- **Permissions**: Added explicit `permissions: contents: read` at workflow level to both `validate.yaml` and `validate-specific.yaml`. Added job-level `permissions: contents: read` to all 9 jobs in `validate-specific.yaml`; `test_val` additionally declares `pull-requests: write` (required by `MishaKav/pytest-coverage-comment` for posting PR comments). The `specific` job in `validate.yaml` declares `contents: read, pull-requests: write` to pass that permission through to `test_val`. Eliminates all zizmor `excessive-permissions` and `undocumented-permissions` findings on the shared workflows.

## [2.0.1] - 2026-06-15 - Gist Secrets Permissions

### Changed

- **Permissions**: Removed workflow-level `permissions: contents: read` from `validate-specific.yaml` and the job-level `permissions` block from `test_val`. Permissions now flow through unchanged from the calling stub. The previous declarations caused a parse-time rejection by GitHub Actions for the theme stub chain (`test_val`'s `contents: write` request exceeded the theme stub's `contents: read` grant), and silently downgraded integration stubs' `contents: write` to `contents: read` before `test_val` tried to re-escalate it. [avoids zizmor failures]
- **Secrets — integration stubs**: `secrets: inherit` replaced with explicit `secrets: GIST_SECRET: ${{ secrets.GIST_SECRET }}` in `validate.yaml` (master) and all five integration stubs. Resolves zizmor `secrets-inherit` audit warning (High confidence). Reverts the broad `secrets: inherit` pattern introduced in v2.0.0.
- **Secrets — theme stub**: `secrets: inherit` removed entirely. The theme has no secrets to pass; `GIST_SECRET` is integration-only and marked `required: false` in the shared workflow.

## [2.0.0] - 2026-06-15 - Validate Specific Separated Theme Support All Checks Blocking

### Added

- **`validate-specific.yaml`**: New workflow containing all 9 category-controlled jobs (`zizmor`, `hassfest`, `hacs_val`, `py_val`, `test_val`, `file_val`, `codespell`, `mypy_val`, `structure_val`).
- **Theme support**: `hacs_val` passes `category` input through to the HACS action. `structure_val` runs for theme projects only. `hassfest`, `py_val`, `test_val`, `mypy_val` run for integration only. `file_val`, `codespell`, `zizmor` run for all.
- **`category` input**: New optional input (default: `integration`) on `validate.yaml` and `validate-specific.yaml` to control which jobs run per project type.

### Changed

- **Workflow architecture**: Split single `validate.yaml` into two-file architecture — `validate.yaml` (master entry point) and `validate-specific.yaml` (all jobs). Project stubs continue to call `validate.yaml` only.
- **`component_name` and `gist_id` inputs**: Changed from required to optional (default `""`).
- **Secrets**: Changed from explicit `GIST_SECRET` secret declaration to `secrets: inherit` pattern. All project stubs updated accordingly.
- **YAML check**: Switched from inline `config_data: "{extends: relaxed}"` to `config_file: .validate/.yamllint` — aligns CI with local devcontainer validation.
- **Codespell**: Both project types now auto-discover config from `pyproject.toml [tool.codespell]`; removed `path_to_config_file` conditional.
- **Zizmor**: Now blocking (`continue-on-error: false`).
- **Mypy**: Now blocking (`continue-on-error: false`).
- **Integration stubs** (`ha-huawei-lte`, `ha-tplink-router-5g-monitor`): Migrated from standalone job definitions to shared workflow stubs.

## [1.1.4-dev2] - 2026-06-15 - Formatting

### Changed

- **Formatting**: Applied newly added formatting fixes (via tasks.json) to repo files.

## [1.1.4-dev1] - 2026-06-15 - Local Validation

### Added

- **Validation**: Added local tasks.json, via Shared system, for Ruff, Prettier, Codespell and Markdown Lint validation and formatting.

## [1.1.3] - 2026-06-14 - CodeQL Permissions

### Changed

- **CodeQL**: Clarified CodeQL permissions, required for ZizMor

## [1.1.2] - 2026-06-14 - Shared CodeQL

### Changed

- **CodeQL**: Added a shared CodeQL validation config, to be called used by each project

## [1.1.1] - 2026-06-14 - Validation Config

### Changed

- **Validation Config**: Fixed use of .prettierrc.json

## [1.1.0] - 2026-06-14 - Validation Config and Link Check

### Changed

- **Link Check**: Updated markdown-link-check to ignore .notes/ and .shared/ links in projects as these are excluded.
- **Validation Config**: Changed from .prettierrc.js to .prettierrc.json to allow GitHub.com CodeQL to run without errors

## [1.0.9] - 2026-06-14 - Docs gitignore License CI Bumps

### Changed

- **DependaBot**: Bumped HASSFest Sha to latest
- **DependaBot**: Bumped HACS Sha to Latest (v6.0.3)
- **DependaBot**: Bumped Ruff from 0.15.12 to 0.15.16
- **Documentation**: Updated README
- **.gitignore**: Multiple updates to .gitignore

### Added

- **License**: Added Apache 2.0 License
- **AGENTS.md**: Added AGENTS.md to repo root.
- **ChangeLog_Local**: Added Local ChangeLog for detailed history

## [1.0.9-dev2] - 2026-06-13 - CI Bump

### Changed

- **DependaBot**: Bumped Ruff from 0.15.12 to 0.15.16

## [1.0.9-dev1] - 2026-06-12 - Docs gitignore

### Changed

- **Documentation**: Updated README
- **.gitignore**: Multiple updates to .gitignore for Obsidian, Code Artifacts and Agent artifacts, incl. general, recommended and forward looking adds

### Added

- **License**: Added Apache 2.0 License
- **CLAUDE.md**: Added Claude.md to repo root.
- **ChangeLog_Local**: Added Local ChangeLog for detailed history

## [1.0.8] - 2026-06-11 - CI Bump Hassfest

### Changed

- **DependaBot**: Bumped HASSFest correctly

## [1.0.7] - 2026-06-10 - CI Bump Hassfest

### Changed

- **DependaBot**: Bumped HASSFest

## [1.0.6] - 2026-06-10 - CI Bump Ruff

### Changed

- **DependaBot**: Bumped Ruff from 0.15.12 to 0.15.15

## [1.0.5] - 2026-05-27 - CI Pins

### Changed

- **Pins**: Pinned versions for ruff, mypy and jsonschema. UNclear whether they should be deployed. For review.

## [1.0.4] - 2026-05-24 - CI Bump Zizmor

### Changed

- **DependaBot**: Bump zizmor from 1.24.1 to 1.25.2

## [1.0.3] - 2026-05-24 - Continue on Error OFF CI Bumps

### Changed

- **Continue on Error**: This was ON for MyPy and ZizMor. Now OFF, errors will be flagged and stop.
- **DependaBot**: Bump codespell-project/actions-codespell from 2.1 to 2.2
- **DependaBot**: Bump schneegans/dynamic-badges-action from 1.7.0 to 1.8.0

## [1.0.2] - 2026-05-09- From Tags to SHA Hashes

### Changed

- **Hashes**: Moved from action tags to hashes for security.

## [1.0.1] - 2026-05-09 - Initial Release

### Added

- **Initial Release**: Shared validation

---

### Format

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
