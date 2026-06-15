# Changelog

All notable changes to this project will be documented in this file.

## [2.0.0] - 2026-06-15 - Release

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

## [1.1.4-dev2] - 2026-06-15 - Unreleased

### Changed

- **Formatting**: Applied newly added formatting fixes (via tasks.json) to repo files.

## [1.1.4-dev1] - 2026-06-15 - Unreleased

### Added

- **Validation**: Added local tasks.json, via Shared system, for Ruff, Prettier, Codespell and Markdown Lint validation and formatting.

## [1.1.3] - 2026-06-14 - Release

### Changed

- **CodeQL**: Clarified CodeQL permissions, required for ZizMor

## [1.1.2] - 2026-06-14 - Release

### Changed

- **CodeQL**: Added a shared CodeQL validation config, to be called used by each project

## [1.1.1] - 2026-06-14 - Release

### Changed

- **Validation Config**: Fixed use of .prettierrc.json

## [1.1.0] - 2026-06-14 - Release

### Changed

- **Link Check**: Updated markdown-link-check to ignore .notes/ and .shared/ links in projects as these are excluded.
- **Validation Config**: Changed from .prettierrc.js to .prettierrc.json to allow GitHub.com CodeQL to run without errors

## [1.0.9] - 2026-06-14 - Release

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

## [1.0.9-dev2] - 2026-06-13 - Unreleased

### Changed

- **DependaBot**: Bumped Ruff from 0.15.12 to 0.15.16

## [1.0.9-dev1] - 2026-06-12 - Unreleased

### Changed

- **Documentation**: Updated README
- **.gitignore**: Multiple updates to .gitignore for Obsidian, Code Artifacts and Agent artifacts, incl. general, recommended and forward looking adds

### Added

- **License**: Added Apache 2.0 License
- **CLAUDE.md**: Added Claude.md to repo root.
- **ChangeLog_Local**: Added Local ChangeLog for detailed history

## [1.0.8] - 2026-06-11 - Release

### Changed

- **DependaBot**: Bumped HASSFest correctly

## [1.0.7] - 2026-06-10 - Release

### Changed

- **DependaBot**: Bumped HASSFest

## [1.0.6] - 2026-06-10 - UNreleasedUNreleased

### Changed

- **DependaBot**: Bumped Ruff from 0.15.12 to 0.15.15

## [1.0.5] - 2026-05-27 - UNreleased

### Changed

- **Pins**: Pinned versions for ruff, mypy and jsonschema. UNclear whether they should be deployed. For review.

## [1.0.4] - 2026-05-24

### Changed

- **DependaBot**: Bump zizmor from 1.24.1 to 1.25.2

## [1.0.3] - 2026-05-24

### Changed

- **Continue on Error**: This was ON for MyPy and ZizMor. Now OFF, errors will be flagged and stop.
- **DependaBot**: Bump codespell-project/actions-codespell from 2.1 to 2.2
- **DependaBot**: Bump schneegans/dynamic-badges-action from 1.7.0 to 1.8.0

## [1.0.2] - 2026-05-09

### Changed

- **Hashes**: Moved from action tags to hashes for security.

## [1.0.1] - 2026-05-09

### Added

- **Initial Release**: Shared validation

---

### Format

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
