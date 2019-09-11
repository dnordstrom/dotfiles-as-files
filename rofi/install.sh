#!/bin/bash

DOTFILES_PATH="$(dirname $0)"

mkdir -p ~/.config/rofi

cp -f "$DOTFILES_PATH/config.rasi" ~/.config/rofi/config.rasi
cp -f "$DOTFILES_PATH/theme.rasi" ~/.config/rofi/theme.rasi