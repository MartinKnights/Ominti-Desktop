# Security policy

## Supported versions

Security fixes are applied to the `main` branch. This project ships a desktop
configuration and installer rather than a long-lived service, so there are no
maintained release branches at present.

## Reporting a vulnerability

**Please do not open a public issue for a security problem.**

Use GitHub's private vulnerability reporting:

1. Open the repository's **Security** tab.
2. Choose **Report a vulnerability**.
3. Include the details below.

If private reporting is unavailable, contact the maintainer through the GitHub
profile listed on the repository and ask for a private channel.

## What to include

- A short description and the impact (what an attacker can do).
- The affected revision or release, and the platform (LMDE 7, Debian 13,
  Ubuntu 24.04, …).
- Reproduction steps or a proof of concept.
- Whether the issue is in the installer, a deployed configuration, the `ominty`
  CLI, or a pinned third-party component.
- Any suggested fix or mitigation.

## Scope

In scope:

- the installer and bootstrap scripts;
- the `ominty` CLI, action registry and adapters in `ominti-core`;
- shipped configuration under `configs/`;
- supply-chain pins and download URLs used by the installer.

Out of scope (report upstream):

- vulnerabilities in Niri, DankMaterialShell, Quickshell, matugen, Ghostty or
  other upstream projects;
- issues that require an already-compromised local account or physical access;
- the security of third-party DMS plugins (report them to their maintainers).

## What to expect

This is a small project maintained on a best-effort basis. There is no formal
SLA. You will get an acknowledgement when the report is seen, an assessment of
whether it is in scope, and a note when a fix is available. Please give the
maintainer reasonable time to release a fix before publishing details.

## Safe harbour

Good-faith research that respects privacy, avoids data destruction and does not
degrade other users' systems is welcome. Do not test against systems you do not
own or have permission to use.
