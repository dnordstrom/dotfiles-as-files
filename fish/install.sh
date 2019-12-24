#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p "$HOME/.config/fish"

ln -sf "$SCRIPT_PATH/config.fish" "$HOME/.config/fish/config.fish"
