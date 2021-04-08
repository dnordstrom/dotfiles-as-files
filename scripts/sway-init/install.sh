#!/usr/bin/env sh

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p "$HOME/.local/bin"

ln -sf "$SCRIPT_PATH/sway-init.sh" "$HOME/.local/bin/sway-init"
