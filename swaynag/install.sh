#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p "$HOME/.config/swaynag"

ln -sf "$SCRIPT_PATH/config" "$HOME/.config/swaynag/config"
