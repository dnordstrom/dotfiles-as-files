#!/usr/bin/env bash

action=$(echo -e "Suspend\nLock\nLogout\nShutdown\nReboot" | wofi -d -p "" -L 5)

if [[ "$action" == "Lock" ]]; then
  swaylock
fi

if [[ "$action" == "Log out" ]]; then
  swaymsg exit
fi

if [[ "$action" == "Reboot" ]]; then
  systemctl reboot
fi

if [[ "$action" == "Shutdown" ]]; then
  systemctl poweroff
fi
