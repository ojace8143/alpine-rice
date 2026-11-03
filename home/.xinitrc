export PATH="$HOME/.local/bin:$PATH"
export SHELL=/bin/zsh
[ -f "$HOME/.config/wallpaper.png" ] && feh --bg-fill "$HOME/.config/wallpaper.png"
exec dwm
