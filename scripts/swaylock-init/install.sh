#!/usr/bin/env sh

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p "$HOME/.local/bin"

ln -sf "$SCRIPT_PATH/swaylock-init.sh" "$HOME/.local/bin/swaylock-init"
