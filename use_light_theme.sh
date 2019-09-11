#!/bin/bash

DOTFILES_PATH="$(dirname $0)"

# Set GTK3+ theme

gsettings set org.gnome.desktop.interface gtk-theme "Arc"
gsettings set org.gnome.desktop.interface icon-theme "Papirus"
gsettings set org.gnome.desktop.interface font-name "Noto Sans Regular 10"
gsettings set org.gnome.desktop.interface document-font-name "Noto Sans Regular 10"

# Set KDE/Kvantum theme

kvantummanager --set KvArc

# Copy and overwrite .Xdefaults

cp -f "$DOTFILES_PATH/Xdefaults/.Xdefaults.ayu-reduced" ~/.Xdefaults

# Termite

mkdir -p ~/.config/termite
cp -f "$DOTFILES_PATH/termite/config.ayu-reduced" ~/.config/termite/config