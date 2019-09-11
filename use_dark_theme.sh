#!/bin/bash

DOTFILES_PATH="$(dirname $0)"

# Set GTK3+ theme

gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface font-name "Noto Sans Regular 10"
gsettings set org.gnome.desktop.interface document-font-name "Noto Sans Regular 10"

# Set KDE/Kvantum theme

kvantummanager --set KvArcDark

# .Xdefaults

cp -f "$DOTFILES_PATH/Xdefaults/.Xdefaults.ayu-mirage" ~/.Xdefaults

# Termite

mkdir -p ~/.config/termite
cp -f "$DOTFILES_PATH/termite/config.ayu-mirage" ~/.config/termite/config