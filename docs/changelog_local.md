# Changelog

All notable changes to this project will be documented in this file.

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
