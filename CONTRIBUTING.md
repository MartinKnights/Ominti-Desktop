# Contributing to Ominti-Desktop

Thanks for helping. This project is a desktop configuration and installer, so a
change usually touches one of four things: the installer, a deployable config,
the `ominty` CLI / action registry (in the `ominty-core` submodule), or the
documentation. All four are reviewed the same way: make the smallest change that
solves the problem, prove it on a real machine or in the test suite, and keep the
docs true.

## Before you start

1. Read [`AGENTS.md`](AGENTS.md) if your change affects installation or the
   desktop contract. It is the rulebook for both humans and AI agents.
2. Open an issue for anything larger than a typo: a new layer, a new pinned
   component, a changed default, or a new user-facing surface.
3. Check [`docs/STYLE.md`](docs/STYLE.md) before editing prose.
4. Never commit credentials, personal paths, API tokens or machine-specific
   configuration. The public configuration must work on a fresh install.

## Development setup

```sh
git clone --recurse-submodules https://github.com/MartinKnights/Ominti-Desktop.git Ominty
cd Ominty
./install.sh --dry-run          # the safe way to see what the installer would do
```

You do not need to run the full installer to work on most changes. The test
suite and the validation commands run on a normal Debian-family host:

```sh
(cd ominty-core && python3 -m pytest -q)     # CLI, registry, adapters, inspect
(cd omi-media && python3 -m pytest -q)       # media discovery and CLI
./ominty-core/cli/ominty registry validate   # 0 errors, 0 warnings
niri validate -c configs/niri/config.kdl      # compositor config
bash scripts/check-docs.sh                    # docs and link invariants
```

For an installer change, always run `./install.sh --dry-run` before and after,
and include the relevant part of the plan in your pull request.

## What a good change looks like

- **One reason to change.** Keep installer fixes, config changes and docs in
  separate commits where practical.
- **Generic, not personal.** No `/home/<you>` paths, no hostnames, no private
  repositories, no tokens. Use `__HOME__` or `$HOME` where the installer
  renders a path.
- **Idempotent.** Running the installer twice must not duplicate a shell block,
  overwrite without a backup, or fail because a file already exists.
- **Backed up.** Any file the installer replaces gets a
  `.bak-ominty-<timestamp>` copy first.
- **Verified.** Add or update a test when the change is testable. For shell
  changes, `bash -n` and a dry run are the minimum.
- **Documented.** If a user-visible behaviour changes, update the relevant guide
  and `CHANGELOG.md`.

## Commit messages

Use a short conventional prefix, then a plain-English summary:

```text
feat(terminal): ship an optional Starship + Zellij profile
fix(install): close every gap the first clean LMDE 7 install exposed
docs(readme): explain what the project is and who it is for
```

The body should say **why**, not restate the diff. Reference the issue if there
is one.

## Documentation changes

- Keep the audience in mind: a first-time user should not have to read the
  architecture document to install the desktop.
- Use the [documentation map](docs/README.md) to decide where a new page belongs.
- Update `scripts/check-docs.sh` if you add a doc that the map should index.
- Prefer a short working example over a long abstract explanation.
- If you add a screenshot, put it in `docs/assets/` with descriptive alt text and
  no personal information in the frame.

## Pull requests

Include:

- what changed and why;
- the commands you ran and their result;
- the OS and desktop you tested on (LMDE 7, Debian 13, Ubuntu 24.04, …);
- anything you could not test.

A pull request that changes the installer without a dry run, or changes a
deployable config without a backup path, will be asked to add one.

## Security

Do not open a public issue for a vulnerability. Follow
[`SECURITY.md`](SECURITY.md).

## License

By contributing, you agree that your contribution is licensed under the
project's MIT license (see [`LICENSE`](LICENSE)).
