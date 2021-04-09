#!/usr/bin/env sh

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p "$HOME/.config/wlogout"

ln -sf "$SCRIPT_PATH/layout" "$HOME/.config/wlogout/"
ln -sf "$SCRIPT_PATH/style.css" "$HOME/.config/wlogout/"
