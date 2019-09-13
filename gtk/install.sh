#!/bin/bash

SCRIPT_PATH=$(dirname "$(realpath -s "$0")")

mkdir -p "$HOME/.config/gtk-3.0"

ln -sf "$SCRIPT_PATH/gtk.css" "$HOME/.config/gtk-3.0/gtk.css"