# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2026-03-25

### Added

- Added standard Beamer theme entrypoint: `\usetheme{gdue}` via `beamerthemegdue.sty`.
- Added configurable options: `progressbar`, `sectionpage`, `darkmode`, `serif`.
- Added public asset customization commands (`\gduesetresourcepath`, `\gduesetlogoname`, etc.).
- Added `codeblock` listings environment with a consistent code style.
- Added `demo/demo.tex` as a comprehensive demonstration deck.
- Added `Makefile` targets for build, clean, install, and uninstall.
- Added GitHub Actions workflow for continuous compile checks.
- Added `docs/USAGE.md` and `CONTRIBUTING.md`.

### Changed

- Refactored `gdue.sty` into a compatibility wrapper to support old usage.
- Replaced outdated sample content in `main.tex` with a clean starter deck.
- Rewrote `README.md` for installation, usage, and development workflows.

### Fixed

- Removed leftover references to old PolyU color identifiers in code listings styles.
- Standardized project build output ignores in `.gitignore`.
