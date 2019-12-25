#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p "$HOME/.config/fish/functions"

ln -sf "$SCRIPT_PATH/config.fish" "$HOME/.config/fish/config.fish"

for filename in "$SCRIPT_PATH"/functions/*; do
  ln -sf "$filename" "$HOME/.config/fish/functions/"
done
