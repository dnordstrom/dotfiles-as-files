#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p "$HOME/.config/mako"

ln -sf "$SCRIPT_PATH/config" "$HOME/.config/mako/config"
