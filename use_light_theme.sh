#!/bin/bash

# Set GTK3+ theme

gsettings set org.gnome.desktop.interface gtk-theme "Arc"
gsettings set org.gnome.desktop.interface icon-theme "Papirus"

# Set KDE/Kvantum theme

kvantummanager --set KvArc

# Copy and overwrite .Xdefaults

cp -f "$(dirname $0)/Xdefaults/.Xdefaults.ayu-reduced" ~/.Xdefaults