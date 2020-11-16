#!/usr/bin/env sh

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p ~/.config/alacritty

ln -sf "$SCRIPT_PATH/alacritty.yml" ~/.config/alacritty/alacritty.yml
