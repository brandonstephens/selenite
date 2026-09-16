#!/usr/bin/env bash
# Builds the GitHub Pages site into _site/: the demo page plus downloadable
# zips of the Nova extension and Ghostty themes. Run by the Pages workflow on
# every push to master; also safe to run locally to preview the output.
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
site="$repo_root/_site"
stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT

rm -rf "$site"
mkdir -p "$site"
cp "$repo_root/index.html" "$repo_root/demo.html" "$site/"

# Nova: unzips to Selenite.novaextension, which installs on double-click.
cp -R "$repo_root/Selenite.novaextension" "$stage/"
(cd "$stage" && zip -qrX "$site/selenite-nova.zip" Selenite.novaextension -x '*.DS_Store')

# Ghostty: unzips to a folder of theme files plus install instructions.
mkdir -p "$stage/Selenite Ghostty"
cp "$repo_root"/Ghostty/* "$stage/Selenite Ghostty/"
(cd "$stage" && zip -qrX "$site/selenite-ghostty.zip" "Selenite Ghostty" -x '*.DS_Store')

echo "Built site -> $site"
ls -lh "$site"
