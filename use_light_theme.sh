#!/bin/bash

FONT="SF Pro Text Regular 9"
GTK_THEME="Ayu"
GTK_ICON_THEME="Papirus"
KVANTUM_THEME="Ayu"
GTK_SCHEMA="org.gnome.desktop.interface"
SCRIPT_PATH=$(dirname "$(realpath -s "$0")")

# Set GTK3+ theme

gsettings set $GTK_SCHEMA gtk-theme "$GTK_THEME"
gsettings set $GTK_SCHEMA icon-theme "$GTK_ICON_THEME"
gsettings set $GTK_SCHEMA font-name "$FONT"
gsettings set $GTK_SCHEMA document-font-name "$FONT"

# Set KDE/Kvantum theme

kvantummanager --set $KVANTUM_THEME

# Copy and overwrite .Xdefaults

ln -sf "$SCRIPT_PATH/Xresources/.Xresources.ayu-reduced" "$HOME/.Xdefaults"

# Termite

mkdir -p "$HOME/.config/termite"
ln -sf "$SCRIPT_PATH/termite/config.ayu-reduced" "$HOME/.config/termite/config"