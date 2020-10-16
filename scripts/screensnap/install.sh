#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

sudo ln -sf "$SCRIPT_PATH/screensnap.desktop" /usr/share/applications/screensnap.desktop
sudo ln -sf "$SCRIPT_PATH/screensnap-copy.desktop" /usr/share/applications/screensnap-copy.desktop
sudo ln -sf "$SCRIPT_PATH/screensnap-upload.desktop" /usr/share/applications/screensnap-upload.desktop

mkdir -p "$HOME/.local/bin"
ln -sf "$SCRIPT_PATH/screensnap.sh" "$HOME/.local/bin/screensnap"
