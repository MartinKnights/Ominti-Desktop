# Ominty shell integration — managed file, sourced from ~/.bashrc.
#
# install.sh copies this file to ~/.config/ominty/shell.bash and adds a small
# source block to ~/.bashrc the first time it runs. Edit the deployed copy to
# customise it; reinstalling backs it up before replacing it.
#
# Set OMINTY_ZELLIJ_AUTOSTART=0 to keep Starship but skip the Zellij autostart.

# zellij comes from the upstream release in ~/.local/bin (Debian 13 does not
# package it), and a fresh ~/.bashrc may not have that directory on PATH yet.
case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) PATH="$HOME/.local/bin:$PATH" ;;
esac
export PATH

# Starship prompt. The STARSHIP_SHELL guard avoids initialising twice when the
# user already has `eval "$(starship init bash)"` in their own ~/.bashrc.
if [ -z "${STARSHIP_SHELL:-}" ] && command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

# Auto-start Zellij only in a desktop terminal Ominty recognises (Alacritty,
# Ghostty, Kitty, WezTerm, Foot, Konsole, or a VTE-based terminal such as GNOME
# Terminal/Tilix). Never inside Zellij, tmux, a Herdr-managed pane, or an SSH
# session: Herdr panes inherit ALACRITTY_WINDOW_ID, so without these guards
# every Herdr pane would exec a nested Zellij and recurse.
if [ "${OMINTY_ZELLIJ_AUTOSTART:-1}" != "0" ] \
    && [ -t 1 ] \
    && [ -z "${ZELLIJ:-}" ] \
    && [ -z "${TMUX:-}" ] \
    && [ -z "${HERDR_ENV:-}" ] \
    && [ -z "${HERDR_PANE_ID:-}" ] \
    && [ -z "${SSH_CONNECTION:-}" ] \
    && [ -z "${SSH_TTY:-}" ] \
    && { [ -n "${ALACRITTY_WINDOW_ID:-}" ] \
        || [ "${TERM_PROGRAM:-}" = "ghostty" ] \
        || [ -n "${KITTY_WINDOW_ID:-}" ] \
        || [ -n "${WEZTERM_PANE:-}" ] \
        || [ "${TERM:-}" = "foot" ] \
        || [ "${TERM:-}" = "foot-extra" ] \
        || [ -n "${VTE_VERSION:-}" ] \
        || [ -n "${KONSOLE_VERSION:-}" ]; } \
    && command -v zellij >/dev/null 2>&1; then
    exec zellij
fi
