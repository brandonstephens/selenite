#!/usr/bin/env bash
# Installs the current Selenite theme(s) from this repo into the local app
# config directories, so re-running always picks up the latest changes.
#
# Usage:
#   ./install.sh              install both Nova and Ghostty
#   ./install.sh nova         install only the Nova extension
#   ./install.sh ghostty      install only the Ghostty themes
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
nova_src="$repo_root/Selenite.novaextension"
ghostty_src="$repo_root/Ghostty"
ghostty_themes=("Selenite Full" "Selenite Dark Full" "Selenite Mono" "Selenite Dark Mono")

install_nova() {
  local identifier dest
  identifier="$(sed -n 's/.*"identifier"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' "$nova_src/extension.json")"
  dest="$HOME/Library/Application Support/Nova/Extensions/$identifier"

  mkdir -p "$dest"
  rsync -a --delete --exclude ".DS_Store" "$nova_src/" "$dest/"
  echo "Installed Nova theme -> $dest"
}

install_ghostty() {
  local dest="$HOME/.config/ghostty/themes"
  mkdir -p "$dest"
  for theme in "${ghostty_themes[@]}"; do
    cp "$ghostty_src/$theme" "$dest/$theme"
  done
  echo "Installed Ghostty themes -> $dest"
}

target="${1:-all}"
target="${target#--}"

case "$target" in
  nova) install_nova ;;
  ghostty) install_ghostty ;;
  all) install_nova; install_ghostty ;;
  -h|help) echo "Usage: $0 [nova|ghostty]"; exit 0 ;;
  *)
    echo "Usage: $0 [nova|ghostty]" >&2
    exit 1
    ;;
esac
