# Glossary

Terms used throughout the documentation. If a page uses a word you do not know,
add it here rather than leaving the gap.

## Desktop

**Niri** — the scrollable-tiling Wayland compositor. It owns windows, outputs,
input and the session. Ominti-Desktop does not fork it; it ships a validated
build and a configuration.

**DankMaterialShell (DMS)** — the desktop shell: bar, launcher, notification
daemon, control centre, lock screen and the plugin host. Built from a pinned
commit with the Ominti-Desktop motion and accent-glow overlay.

**Quickshell** — the Qt/QML toolkit DMS is built on. Ominti-Desktop pins
`v0.3.1` because the validated DMS shell does not run reliably on Debian's
`0.3.0`.

**Shell overlay** — the small patch applied to the built DMS shell that adds the
motion tuning and the accent glow. It is coupled to a specific shell build id
and is re-applied after a DMS rebuild.

**Session** — the desktop you choose at the display manager. The Ominti-Desktop
session runs Niri; the installer can make it the login default with
`--session-default niri`.

## Actions and configuration

**Action** — one named thing the desktop can do, declared once in the registry
(for example `app.terminal.open` or `system.volume.up`). Actions have an id, a
name, keywords, keybindings, a risk level and an adapter.

**Action registry** — the collection of action definitions in
`ominty-core/actions/*.toml`. It is the single source of truth: the Niri
keybindings, the DMS launcher entries and the cheat sheet are generated from it.

**Adapter** — the code that executes an action (`app.launch`, `niri.msg`,
`shell.exec`, …). Adapters keep actions declarative and testable.

**Role** — a named application slot (for example `terminal`, `browser`,
`editor`) resolved from `~/.config/ominty/apps.toml`. Actions refer to roles,
not hard-coded executables, so `Super+Enter` follows your terminal choice.

**Layer** — a group of packages and configuration that can be installed
together (`desktop`, `terminal`, `editor`, `cli`, `containers`, `browser`,
`tts`). The manifest in `ominty-core/cli/omintylib/inspect.py` is the single
source of truth for what each layer contains.

**Provisioned** — a layer the installer knows how to install today. An
unprovisioned layer is reported as such, not treated as broken.

**Required vs optional package** — `ominty inspect` fails a layer only when a
required package is missing. Optional packages (for example the two alternative
terminal emulators, or Zellij) are reported but do not block.

**Pin** — an exact commit, tag or release the installer builds from. Pins are
what make the desktop reproducible across machines.

**Shell build id** — the identifier of the built DMS shell. It keys the QML
cache and is reported by `ominty inspect`; it changes when the DMS pin changes.

## Surfaces

**Surface** — a user-facing part of the desktop: a bar, a popup, a panel or a
launcher. The official names are in [NAMING.md](NAMING.md).

**Interaction explorer** — `Super+K`; searches and runs every registered action.

**Universal palette** — `Super+Space`; searches applications and actions
together.

**Ominty Media / Dictionary / Reader / Dictation / Capture / Scripts** — the six
shipped surfaces. The UI names keep the historical `Ominty` prefix; see the
[naming note](../README.md#naming-and-compatibility).

## Platform and install

**Layer manifest** — see *Layer*.

**Bootstrap** — `bootstrap.sh`; fetches the checkout in retryable steps
(metadata, source, submodule, bundled `.deb`s) and resumes after a dropped
connection.

**Dry run** — `./install.sh --dry-run`. Prints every command the installer would
run and changes nothing. Use it before every real install or upgrade.

**Migration** — the deliberate path for a machine that already has a desktop.
It assesses what is installed, preserves what should be kept and replaces only
what is chosen.

**Matugen** — the wallpaper-to-theme generator that renders the Niri border,
accent glow and animation colours from the current wallpaper.

**TTS / OCR** — text to speech (Piper / `ominty tts`) and optical character
recognition (`screen-ocr` / `ominty` capture actions).
