#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p "$HOME/.config/sway"

ln -sf "$SCRIPT_PATH/config" "$HOME/.config/sway/config"
ln -sf "$SCRIPT_PATH/colors.ayu" "$HOME/.config/sway/"
ln -sf "$SCRIPT_PATH/colors.ayu-mirage" "$HOME/.config/sway/"
ln -sf "$SCRIPT_PATH/colors.ayu-dark" "$HOME/.config/sway/"
