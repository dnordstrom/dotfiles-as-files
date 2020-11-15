#!/usr/bin/env sh

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

sudo ln -sf "$SCRIPT_PATH/colorsnap.desktop" /usr/share/applications/colorsnap.desktop

mkdir -p "$HOME/.local/bin"
ln -sf "$SCRIPT_PATH/colorsnap.sh" "$HOME/.local/bin/colorsnap"
