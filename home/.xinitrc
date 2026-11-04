export PATH="$HOME/.local/bin:$PATH"
export SHELL=/bin/zsh
# wallpaper (first match wins, w/ any extension)
for wall in "$HOME"/.config/wallpaper.*; do
	[ -f "$wall" ] && { feh --bg-fill "$wall"; break; }
done

# Session D-Bus. Flatpak apps (Discord via zypak) abort without it.
exec dbus-run-session -- dwm
