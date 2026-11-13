# Documentation assets

Put screenshots, GIFs and diagrams here when a guide needs one.

## Rules

- **No personal information.** Crop out hostnames, usernames, email, tokens,
  private paths, notifications and file names. If a screen cannot be shown
  without them, do not use it.
- **Name by purpose**, not by date: `bar-overview.png`, `palette-search.png`,
  `installer-dry-run.png`.
- **Add alt text** in the page that uses it. Describe what the image proves, not
  "screenshot".
- **Prefer a GIF or a short MP4** for motion (launcher, popups, glow). Keep it
  under a few MB; link the full-quality version if needed.
- **Compress** PNGs (`optipng`/`pngquant`) and remove metadata
  (`exiftool -all=`).

## Suggested shots

| Page | Shot |
| --- | --- |
| README / INSTALL | The DMS bar with the Ominti-Desktop accent glow |
| README | The interaction explorer (`Super+K`) with a search term typed |
| README | The universal palette showing apps and actions together |
| INSTALL | The `[DRY ]` plan, before the real install |
| INSTALL | First login, Niri session selected |
| FAQ | The terminal profile (Starship prompt + Zellij) |

## Diagrams

Architecture and flow diagrams use Mermaid in the page itself
(see [ARCHITECTURE.md](../ARCHITECTURE.md)). Only add a raster diagram if the
Mermaid version cannot express it.
