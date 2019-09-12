#!/bin/bash

SCRIPT_PATH=$(dirname "$(realpath -s "$0")")

mkdir -p ~/.config/rofi

cp -f "$SCRIPT_PATH/config.rasi" ~/.config/rofi/config.rasi
cp -f "$SCRIPT_PATH/theme.rasi" ~/.config/rofi/theme.rasi