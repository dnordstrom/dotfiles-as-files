#!/bin/sh
#
# Launch script for Sway window manager
#

export TERMINAL="alacritty"
export BROWSER="firefox-trunk"
export EDITOR="nvim"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORM="wayland"
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_STYLE_OVERRIDE="kvantum"
export GDK_BACKEND="wayland"
export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

sway
