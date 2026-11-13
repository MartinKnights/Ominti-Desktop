# Ominti-Desktop documentation

Ominti-Desktop is a keyboard-first Niri + DankMaterialShell desktop for Debian
13 and LMDE 7, installed and configured by one idempotent script. This is the
documentation map.

Pick the path that matches what you are trying to do; each page says who it is
for and what you should know by the end.

## I want to install it

| Page | What it covers |
| --- | --- |
| [INSTALL.md](INSTALL.md) | Requirements, the 60-second install, options, what the installer does, first login, updates and uninstall. **Start here for a clean machine.** |
| [MIGRATION.md](MIGRATION.md) | Assessing an existing Cinnamon/GNOME desktop before replacing it, and what is deliberately preserved. |
| [TROUBLESHOOTING.md](TROUBLESHOOTING.md) | Symptom → check → fix, with a diagnostic collector. |
| [HARDWARE.md](HARDWARE.md) | The reference machine, output/scale setup and hardware profiles. |
| [UBUNTU.md](UBUNTU.md) | Ubuntu-family support and the source-build path. |

## I want an AI agent to install or maintain it

| Page | What it covers |
| --- | --- |
| [../AGENTS.md](../AGENTS.md) | The contract every deploying agent must follow: assessment, questions, plan, install, verify, report. |
| [PROMPTS.md](PROMPTS.md) | Copy-paste prompts for install, upgrade and repair. |
| [AGENT-INSTALL.md](AGENT-INSTALL.md) | The agent-executable fresh-install runbook, with gates and expected outputs. |
| [AGENT-UPGRADE.md](AGENT-UPGRADE.md) | The agent-executable upgrade and friction-report runbook. |

## I want to understand how it works

| Page | What it covers |
| --- | --- |
| [ARCHITECTURE.md](ARCHITECTURE.md) | The layers, the action registry, the installer, and how Niri, DMS and Quickshell fit together. |
| [NAMING.md](NAMING.md) | The official name of every surface, and the rule for new ones. |
| [GLOSSARY.md](GLOSSARY.md) | Niri, DMS, Quickshell, action registry, layers, roles, pins and other terms. |
| [INSPECT.md](INSPECT.md) | Every field of `ominty inspect --json`, for humans and agents. |
| [FAQ.md](FAQ.md) | Common questions about scope, hardware, AI, updates and uninstalling. |

## I want to maintain, extend or contribute

| Page | What it covers |
| --- | --- |
| [MAINTAINING.md](MAINTAINING.md) | Pins, lockfiles, overlay patches, the release checklist and the docs invariants. |
| [STYLE.md](STYLE.md) | How to write documentation for this project. |
| [../CONTRIBUTING.md](../CONTRIBUTING.md) | The contribution workflow, tests and pull-request expectations. |
| [../SECURITY.md](../SECURITY.md) | How to report a vulnerability privately. |
| [plans/](plans/) | Design records and implementation reports. These are historical; the current guides above win when they disagree. |

## Conventions used in these docs

- **Commands** are shown in `sh` blocks and assume you are in the repository
  root (`~/Ominty`) unless stated otherwise.
- **`sudo`** is called out explicitly. The installer asks for it once and keeps
  it alive through the source builds.
- **Paths** beginning with `~/` are relative to your user account. The installer
  renders its own templates with `__HOME__`; you should not need to edit them.
- **Product vs runtime names:** the product is **Ominti-Desktop**, the
  repositories are `Ominti-Desktop` and `ominti-core`, and the runtime keeps the
  historical `ominty` names (CLI, config directory, environment variables). This
  is explained in the [README](../README.md#naming-and-compatibility).

## Documentation status

The docs are checked by `scripts/check-docs.sh` before every push: links,
referenced scripts, stale claims and repository URLs. If you add a page, add it
to this map and to the check's index. Screenshots and diagrams live in
[`assets/`](assets/README.md).
