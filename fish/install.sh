#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p "$HOME/.config"

ln -sf "$SCRIPT_PATH" "$HOME/.config/fish"
