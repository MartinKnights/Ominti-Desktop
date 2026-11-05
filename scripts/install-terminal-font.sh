#!/usr/bin/env bash
#
# Ominty — install the MesloLGM Nerd Font used by the terminal profile.
#
# Debian 13 ships no Nerd Font package (fonts-meslo-lg-nerd-font does not
# exist), and both the Starship prompt and the Alacritty/Zellij configuration
# name "MesloLGM Nerd Font". Without it the prompt glyphs fall back to boxes.
#
# This is best effort: the download may be unavailable, and the desktop works
# without it. Installs into the user font directory and refreshes the cache.
# The Nerd Fonts release is pinned; override with OMINTY_NERD_FONT_VERSION.
#
# Usage: scripts/install-terminal-font.sh [--dry-run]
#
set -euo pipefail

DRY_RUN=0
for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=1 ;;
    -h|--help)
      sed -n '2,12p' "$0" | sed 's/^# \{0,1\}//'
      exit 0 ;;
    *) echo "Unknown argument: $arg" >&2; exit 2 ;;
  esac
done

say()  { printf '\033[1;34m[Ominty]\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m[WARN]\033[0m %s\n' "$*"; }
plan() { printf '\033[1;35m[DRY ]\033[0m %s\n' "$*"; }

have() { command -v "$1" >/dev/null 2>&1; }

FONT_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fonts/nerd-fonts-meslo"
FONT_VERSION="${OMINTY_NERD_FONT_VERSION:-v3.5.1}"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/${FONT_VERSION}/Meslo.zip"

if have fc-list && fc-list 2>/dev/null | grep -qi 'MesloLGM Nerd Font'; then
  say "MesloLGM Nerd Font is already installed."
  exit 0
fi

if [ "$DRY_RUN" -eq 1 ]; then
  plan "curl -fsSL $FONT_URL -o <tmp>/Meslo.zip"
  plan "extract Meslo.zip into $FONT_DIR"
  plan "fc-cache -f $FONT_DIR"
  exit 0
fi

if ! have curl; then
  warn "curl is required to download the Meslo Nerd Font; skipping."
  exit 1
fi
if ! have fc-cache; then
  warn "fontconfig (fc-cache) is required to register the font; skipping."
  exit 1
fi

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

say "Downloading MesloLGM Nerd Font (best effort)..."
if ! curl -fsSL --retry 3 --retry-delay 2 -o "$tmp/Meslo.zip" "$FONT_URL"; then
  warn "Could not download $FONT_URL; the terminal prompt will use a fallback font."
  exit 1
fi

mkdir -p "$FONT_DIR"
if have unzip; then
  unzip -q -o "$tmp/Meslo.zip" -d "$FONT_DIR"
else
  python3 -m zipfile -e "$tmp/Meslo.zip" "$FONT_DIR"
fi
fc-cache -f "$FONT_DIR" >/dev/null 2>&1 || fc-cache -f >/dev/null 2>&1 || true

if fc-list 2>/dev/null | grep -qi 'MesloLGM Nerd Font'; then
  say "MesloLGM Nerd Font installed in $FONT_DIR."
else
  warn "Font files were extracted to $FONT_DIR but fontconfig does not list them yet; log out and back in."
fi
