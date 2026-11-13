# Documentation style guide

The docs are part of the product. A new user should be able to install
Ominti-Desktop without reading the source, and a maintainer should be able to
change a pin without guessing what else is coupled to it.

## Voice

- Write in the **second person**: "you run", not "the user runs".
- Prefer **plain English** over marketing language. Say what a thing does, then
  why it matters.
- Be **specific**: "takes 20–40 minutes", not "takes a while".
- Use **present tense** for behaviour and **imperative** for instructions.
- Do not blame the reader. "If the build fails, collect the log" is better than
  "you forgot the dependency".

## Structure

Every guide should answer three questions in the first screenful:

1. **Who is this for?**
2. **What will I have when I finish?**
3. **How long will it take, and what do I need first?**

Then:

- one `#` heading per page;
- `##` for major sections, `###` for steps;
- a short introduction before the first command;
- a **Next steps** or **Verify** section at the end.

Do not nest headings deeper than `###` unless the page genuinely needs it.

## Naming

- Product: **Ominti-Desktop**.
- Repositories: **`Ominti-Desktop`** and **`ominti-core`**.
- Runtime identifiers keep their names: `ominty` CLI, `~/.config/ominty`,
  `OMINTY_*`, `~/Ominty`, `ominty-core/`.
- Surface names: **Ominty Media**, **Ominty Dictionary**, **Ominty Reader**,
  **Ominty Dictation**, **Ominty Capture**, **Ominty Scripts**. Do not invent
  alternative names; see [NAMING.md](NAMING.md).
- Expand an acronym on first use, then link to [GLOSSARY.md](GLOSSARY.md).

## Commands

- Use fenced blocks tagged `sh`, `kdl`, `json`, `text` or `mermaid`.
- Show the command from the directory the reader is actually in. State the
  directory if it is not the repository root.
- Put `sudo` in the command when it is required, and warn before a destructive
  step.
- Use `$HOME` or `~/` consistently; do not mix `/home/<name>` into generic docs.
- Prefer a short working example over an exhaustive list of flags. Link to
  `--help` or the reference page for the rest.

## Links

- Use descriptive link text: "the [installation guide](INSTALL.md)", not
  "[here](INSTALL.md)".
- Link to the page, not a line number, unless the line is stable.
- Every relative link must resolve. `scripts/check-docs.sh` enforces this.
- When a link is historical, say so: "the original report is in
  [plans/](plans/)".

## Images and diagrams

- Put images in `docs/assets/` and use a descriptive alt text. See
  [`assets/README.md`](assets/README.md) for naming, privacy and compression.
- Do not include personal information (hostnames, email, tokens, private paths)
  in a screenshot.
- Prefer a Mermaid diagram for architecture and flows; it stays readable in
  GitHub, the terminal and a future docs site.
- Keep diagrams small: one idea per diagram.

## Tables

Use a table when the reader needs to compare options or look something up.
Do not use a table for prose. Keep the first column a noun, not a sentence.

Examples:

- good: `| Flag | Effect |`
- bad: `| If you want to do this, use | What happens |`

## Warnings and notes

Use GitHub blockquotes for a note or a warning:

> **Note:** the installer backs up every file it replaces.

Use a warning only for something that can lose data or lock the user out. If
everything is a warning, nothing is.

## Changelog and docs checks

- User-visible changes get an entry in [`CHANGELOG.md`](../CHANGELOG.md).
- New pages must be added to [`docs/README.md`](README.md).
- Run `bash scripts/check-docs.sh` before pushing. It checks links, stale
  claims, referenced scripts and repository URLs.

## A quick checklist

- [ ] Does the first paragraph say what this page is for?
- [ ] Is the first command copy-pasteable from the stated directory?
- [ ] Are prerequisites and time/space stated before the install command?
- [ ] Is every acronym expanded or linked?
- [ ] Do all relative links resolve?
- [ ] Is there a "what next" at the end?
- [ ] Did you avoid personal paths, hostnames and credentials?
