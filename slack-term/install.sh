#!/usr/bin/env sh

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p "$HOME/.config/slack-term"

ln -sf "$SCRIPT_PATH/config" "$HOME/.config/slack-term/config"
