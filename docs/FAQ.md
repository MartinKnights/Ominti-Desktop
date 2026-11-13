# Frequently asked questions

## What exactly is Ominti-Desktop?

A desktop layer for Debian 13 and LMDE 7: Niri (compositor), DankMaterialShell
(shell), a pinned Quickshell, a CLI/action registry, six desktop surfaces and a
one-command installer that ties them together. It is not a Linux distribution
and it does not ship its own ISO or kernel.

## Does it replace my current desktop?

Only if you choose that path. A **clean install** assumes you want Ominti-Desktop
as the desktop. If the machine already runs Cinnamon, GNOME or another desktop,
read [MIGRATION.md](MIGRATION.md) first: it assesses the existing setup and
preserves what should be kept. Ominti-Desktop does not silently remove your
existing desktop.

## Can I keep Cinnamon/GNOME alongside it?

The installer does not set up a dual-desktop session for you. You can select a
different session at the display manager if one remains installed, but the
supported path is a deliberate migration, not two desktops fighting over the
same configuration. Ask in an issue before relying on a dual setup.

## Which versions are supported?

- **Validated:** LMDE 7 (gigi) / Debian 13 (trixie), x86_64.
- **Supported through a source build:** Ubuntu 24.04-family, x86_64.
- **Refused:** Debian 12 / LMDE 6 (no `trixie-backports`). Upgrade first.

See [HARDWARE.md](HARDWARE.md) for the reference machine and output/scale notes.

## Does it work on ARM?

Not currently. The installer supports `x86_64` and `aarch64` for some source
builds, but the validated path and the bundled Niri `.deb` are x86_64. Treat ARM
as untested until a profile exists.

## Does it work with NVIDIA?

Two reference machines are documented: a Surface Book 1 and a Dell Precision
T7910, both using the open `nouveau` stack (the Surface Book's discrete GPU is
powered off by default). A proprietary NVIDIA driver setup is not part of the
validated path. Use `--dry-run`, keep a recovery session available, and report
what you find.

## How long does it take, and how much space?

Expect **20–40 minutes** and about **10 GB free** on a first install: Quickshell
and DMS are built from source and the optional speech model is about 142 MB. A
re-run on a machine that already built them takes a few minutes.

## Does it need an internet connection?

Yes, for the first install: APT packages and keys, source pins, and the bundled
`.deb`s. The bootstrap is resumable and can use a local `packages/` directory
for an offline install of the `.deb`s. AI setup is optional and happens last.

## Does it require an AI model?

No. The installer leaves AI unconfigured (`default_provider = "none"`). The AI
menu and the optional Ollama/Pi setup are a final, separate step
(`scripts/setup-ai.sh`). Nothing about the desktop depends on a model download
or credentials.

## Can I choose my own terminal?

Yes: `./install.sh --terminal alacritty|ghostty|<package>|none`. `none` keeps
your emulator but still deploys the Starship/Zellij profile. See the
[terminal profile](INSTALL.md#terminal-profile-optional) section.

## Can I skip parts of the install?

Yes. `--layers "desktop editor cli"` installs only those layers; `--no-plugins`
skips DMS plugins; `--terminal none` skips the emulator. The manifest and
`ominty inspect` report what is missing rather than pretending a layer is
complete.

## Why do the commands and folders still say `ominty`?

The product and repositories were renamed to **Ominti-Desktop** and
**ominti-core**, but the runtime keeps the historical `ominty` identifiers so
existing installs, scripts and configuration continue to work: the `ominty` CLI,
`~/.config/ominty`, `OMINTY_*` variables and the `~/Ominty` checkout. The six
desktop surfaces use the short prefix `Omi` (`Omi Media`, `Omi Dictionary`, …).
See the [naming note](../README.md#naming-and-compatibility).

## How do I update?

```sh
cd ~/Ominty
git pull
git submodule sync --recursive
git submodule update --init --recursive
./install.sh          # idempotent; backs up and replaces configuration
```

The detailed update path, including what the re-run rebuilds, is in
[INSTALL.md](INSTALL.md#7-updating).

## How do I uninstall it?

See [INSTALL.md](INSTALL.md#uninstall). Keep a working session available until
you have verified the removal; the installer can be re-run to restore the
desktop configuration.

## Something is broken. What should I collect first?

Run `scripts/collect-diagnostics.sh` (read-only), then `scripts/smoke-dms.sh`,
`scripts/verify-upgrade.sh` and `scripts/verify-parity.py`. The diagnostics
folder contains `SUMMARY.txt` plus system, package, unit, config and crash
reports. See [TROUBLESHOOTING.md](TROUBLESHOOTING.md) for the symptom index.

## Is it secure?

The installer uses pinned sources, backs up replaced configuration and never
stores credentials. Report vulnerabilities privately via
[SECURITY.md](../SECURITY.md). Third-party components (Niri, DMS, Quickshell,
plugins) keep their own security processes.

## Can I contribute?

Yes. Read [CONTRIBUTING.md](../CONTRIBUTING.md) and the
[documentation style guide](STYLE.md). Small, tested changes with a dry run are
the easiest to review.

## What is the license?

MIT for this repository; third-party components keep their own licenses. See
[LICENSE](../LICENSE).
