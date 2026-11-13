# Changelog

All notable changes to Ominti-Desktop are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and the project aims
to use [Semantic Versioning](https://semver.org/) once releases are tagged.

## Unreleased

### Changed

- Renamed the GitHub repositories to **Ominti-Desktop** and **ominti-core**.
  The product name is now **Ominti-Desktop**; runtime identifiers (`ominty` CLI,
  `~/.config/ominty`, `OMINTY_*`, `~/Ominty`) remain stable for compatibility.
- Rebuilt the documentation around the user's task: a new README, a docs map,
  a glossary, an FAQ and a documentation style guide.
- Added `CONTRIBUTING.md`, `SECURITY.md`, `CHANGELOG.md` and an MIT `LICENSE`.
- Updated every clone, raw-download and repository link to the new names.
- Documented the rename in the project progress logs.

### Fixed

- `scripts/check-docs.sh` now checks repository URLs and indexes the new docs.

## 2026-11-05

### Added

- Optional terminal profile: Starship, Zellij and a terminal emulator chosen with
  `--terminal alacritty|ghostty|<package>|none`.
- Portable Zellij layout, Nord/Gruvbox themes and a managed `~/.config/ominty/shell.bash`
  snippet with a guarded Zellij autostart.
- Best-effort MesloLGM Nerd Font installer.

### Changed

- Alacritty and Ghostty are alternatives in the layer manifest; only the chosen
  emulator is installed.

## 2026-10-26

### Fixed

- Closed the gaps exposed by the first clean LMDE 7 install: the user systemd
  directory, Quickshell/Qt runtime dependencies, the pinned Quickshell build,
  the Niri `.deb` install order and the empty wallpaper set.
- AI setup moved to the final phase (`scripts/setup-ai.sh`); the installer no
  longer requires a model download.

## 2026-10-25

### Added

- Resumable `bootstrap.sh` for slow or unreliable links.
