#!/usr/bin/env bash

SCRIPT_PATH="$(dirname $(realpath -s $0))"

ln -sf "$SCRIPT_PATH/edit-dotfiles.desktop" /usr/share/applications/edit-dotfiles.desktop
