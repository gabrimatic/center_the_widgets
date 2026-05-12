# Changelog

This changelog tracks notable CenterTheWidgets changes.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [2.0.0] - 2026-05-12

### Added

- Added optional height limiting with `maxHeightToResize`.
- Added child alignment control with `alignment`.
- Added background image fit and alignment controls with `edgesImageFit` and `edgesImageAlignment`.
- Added widget tests for enabled, disabled, wide-screen, narrow-screen, height, and background behavior.
- Added GitHub Actions CI and Dependabot coverage.
- Added pub.dev metadata for repository, issue tracker, funding, topics, screenshots, and platform support.

### Changed

- Modernized the package for Dart 3 and current Flutter stable releases.
- Reworked the layout implementation around `LayoutBuilder`, `DecoratedBox`, `Align`, and `SizedBox` so the widget works from bounded Flutter constraints instead of repeatedly reading `MediaQuery`.
- Updated README, example docs, API docs, and package description to match the current maintainer style.
- Updated Flutter lints to the current major version.

### Fixed

- Removed the old SDK upper-bound publish hint by declaring a current Dart SDK constraint.

## [1.0.0+3] - 2022-02-03

- Updated package metadata.

## [1.0.0+2] - 2022-02-03

- Updated README.

## [1.0.0+1] - 2022-02-02

- Updated package description.

## [1.0.0] - 2022-02-02

- Initial release.
