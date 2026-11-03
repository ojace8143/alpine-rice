# ~/.zprofile — login shell setup (zsh equivalent of .bash_profile)

# Ensure child processes (dwm, alacritty, …) see the login shell as zsh.
export SHELL=/bin/zsh

# Raise open-file descriptor soft limit; harmless if the hard limit is lower.
ulimit -n 1048576 2>/dev/null || true

# XDG runtime dir: prefer /run/user/$UID, fall back to /tmp on systems without it.
if [ -z "$XDG_RUNTIME_DIR" ] || [ ! -d "$XDG_RUNTIME_DIR" ]; then
  if [ -d "/run/user/$(id -u)" ]; then
    export XDG_RUNTIME_DIR=/run/user/$(id -u)
  else
    export XDG_RUNTIME_DIR=/tmp/runtime-$(id -u)
    mkdir -p "$XDG_RUNTIME_DIR" 2>/dev/null
    chmod 700 "$XDG_RUNTIME_DIR" 2>/dev/null
  fi
fi

# Toolkit cursors (X11).
export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=24
