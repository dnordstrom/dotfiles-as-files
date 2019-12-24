#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p "$HOME/.config/tuir"

ln -sf "$SCRIPT_PATH/config" "$HOME/.config/tuir/tuir.cfg"
