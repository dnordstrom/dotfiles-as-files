#!/usr/bin/env bash

SCRIPT_PATH=$(dirname "$(realpath -s "$0")")

mkdir -p "$HOME/.config/waybar"

ln -sf "$SCRIPT_PATH/config" "$HOME/.config/waybar/config"
ln -sf "$SCRIPT_PATH/style.css" "$HOME/.config/waybar/style.css"
