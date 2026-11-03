#!/bin/sh
# install.sh — symlink this repo's config files into place.
#
# Layout:
#   home/  -> $HOME
#   dwm/   -> $HOME/src/dwm
#
# Existing regular files are never overwritten; move them into the repo
# yourself first (that is the "adopt" step). Existing symlinks are replaced.

set -eu

repo=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)

# Relative path from directory $1 to file $2 (both absolute).
relpath() {
	awk -v from="$1" -v to="$2" 'BEGIN {
		nf = split(from, a, "/");
		nt = split(to, b, "/");
		i = 1;
		while (i <= nf && i <= nt && a[i] == b[i]) i++;
		out = "";
		for (j = i; j <= nf; j++) out = out "../";
		for (j = i; j <= nt; j++) out = out b[j] (j < nt ? "/" : "");
		if (out == "") out = ".";
		print out;
	}'
}

link() {
	src=$1
	dst=$2
	if [ -e "$dst" ] && [ ! -L "$dst" ]; then
		printf 'refusing to overwrite existing file: %s\n' "$dst" >&2
		exit 1
	fi
	mkdir -p "$(dirname -- "$dst")"
	rel=$(relpath "$(CDPATH= cd -- "$(dirname -- "$dst")" && pwd -P)" "$src")
	ln -sfn -- "$rel" "$dst"
	printf '%s -> %s\n' "$dst" "$rel"
}

link_package() {
	pkg=$1
	target=$2
	[ -d "$repo/$pkg" ] || return 0
	find "$repo/$pkg" -type f | while IFS= read -r src; do
		rel=${src#"$repo/$pkg/"}
		link "$src" "$target/$rel"
	done
}

link_package home "$HOME"
link_package dwm "$HOME/src/dwm"

echo "done."
