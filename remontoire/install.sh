#!/usr/bin/env sh

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p "$HOME/.config/remontoire"

ln -sf "$SCRIPT_PATH/styles.css" "$HOME/.config/remontoire/styles.css"
