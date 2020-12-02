#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p "$HOME/.config/wofi"

ln -sf "$SCRIPT_PATH/config" "$HOME/.config/wofi/config"
ln -sf "$SCRIPT_PATH/style.css" "$HOME/.config/wofi/style.css"
