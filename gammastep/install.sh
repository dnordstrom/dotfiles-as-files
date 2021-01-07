#!/usr/bin/env sh

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p "$HOME/.config/gammastep"

ln -sf "$SCRIPT_PATH/config.ini" "$HOME/.config/gammastep/config.ini"
