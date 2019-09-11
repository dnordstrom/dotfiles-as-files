#!/bin/bash

# Set GTK3+ theme

gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface font-name "Noto Sans Regular 10"
gsettings set org.gnome.desktop.interface document-font-name "Noto Sans Regular 10"

# Set KDE/Kvantum theme

kvantummanager --set KvArcDark

# Copy and overwrite .Xdefaults

cp -f "$(dirname $0)/Xdefaults/.Xdefaults.ayu-mirage" ~/.Xdefaults