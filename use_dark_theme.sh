#!/bin/bash

FONT="SF Pro Text Regular 9"
GTK_THEME="Arc-Dark"
GTK_ICON_THEME="Papirus-Dark"
GTK_SCHEMA="org.gnome.desktop.interface"
KVANTUM_THEME="KvArcDark"
SCRIPT_PATH=$(dirname "$(realpath -s "$0")")

# Set GTK3+ theme

gsettings set $GTK_SCHEMA gtk-theme "$GTK_THEME"
gsettings set $GTK_SCHEMA icon-theme "$GTK_ICON_THEME"
gsettings set $GTK_SCHEMA font-name "$FONT"
gsettings set $GTK_SCHEMA document-font-name "$FONT"

# Set KDE/Kvantum theme

kvantummanager --set $KVANTUM_THEME

# .Xdefaults (urxvt does not read .Xresources on launch)

ln -sf "$SCRIPT_PATH/Xresources/.Xresources.ayu-mirage" "$HOME/.Xdefaults"

# Termite

mkdir -p "$HOME/.config/termite"
ln -sf "$SCRIPT_PATH/termite/config.ayu-mirage" "$HOME/.config/termite/config"