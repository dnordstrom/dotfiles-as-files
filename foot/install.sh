#!/usr/bin/env sh

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p "$HOME/.config/foot"

ln -sf "$SCRIPT_PATH/foot.ini" "$HOME/.config/foot/foot.ini"
