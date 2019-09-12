#!/bin/bash

SCRIPT_PATH=$(dirname "$(realpath -s "$0")")

mkdir -p ~/.config/rofi

ln -sf "$SCRIPT_PATH/config.rasi" ~/.config/rofi/config.rasi
ln -sf "$SCRIPT_PATH/ayu.rasi" ~/.config/rofi/ayu.rasi
ln -sf "$SCRIPT_PATH/ayu-mirage.rasi" ~/.config/rofi/ayu-mirage.rasi
ln -sf "$SCRIPT_PATH/ayu-dark.rasi" ~/.config/rofi/ayu-dark.rasi