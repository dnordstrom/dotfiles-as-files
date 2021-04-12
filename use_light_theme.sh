#!/usr/bin/env sh

printf "\n%s" "Switching GTK and QT/Kvantum to light theme... "

FONT="Input Regular 9"
GTK_THEME="Ayu"
GTK_ICON_THEME="Flat-Remix-Yellow-Light"
GTK_SCHEMA="org.gnome.desktop.interface"
KVANTUM_THEME="Ayu"
SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

# Set GTK3+ theme
gsettings set $GTK_SCHEMA gtk-theme "$GTK_THEME"
gsettings set $GTK_SCHEMA icon-theme "$GTK_ICON_THEME"
gsettings set $GTK_SCHEMA font-name "$FONT"
gsettings set $GTK_SCHEMA document-font-name "$FONT"

# Set Kvantum theme
kvantummanager --set $KVANTUM_THEME

# .Xdefaults (urxvt does not read .Xresources on launch)
ln -sf "$SCRIPT_PATH/Xresources/.Xresources.ayu-reduced" "$HOME/.Xdefaults"

# Termite
mkdir -p "$HOME/.config/termite"
ln -sf "$SCRIPT_PATH/termite/config.ayu-reduced" "$HOME/.config/termite/config"

# Alacritty
sed -i -e 's/^colors:.*$/colors: \*ayu/' "$SCRIPT_PATH/alacritty/alacritty.yml"

#
# Done
#

printf "%s\n\n%s\n\n" "Done." "Note: Some applications (e.g., Sway, wofi, and most terminal emulators) require you to manually edit their configuration files to switch themes."
