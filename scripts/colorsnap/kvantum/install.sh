#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

ln -sf "$SCRIPT_PATH/Ayu" /usr/share/Kvantum/
ln -sf "$SCRIPT_PATH/AyuDark" /usr/share/Kvantum/
ln -sf "$SCRIPT_PATH/AyuMirage" /usr/share/Kvantum/
