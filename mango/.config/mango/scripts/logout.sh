#!/usr/bin/env bash
# MangoWC Power Menu using Rofi (Wayland-compatible)

# Options
OPTIONS="Shutdown\nReboot\nLock\nSuspend\nLogout"

# Launch Rofi in dmenu mode
CHOICE=$(printf "%b" "$OPTIONS" | rofi -dmenu -p "Power:" -lines 5)

case "$CHOICE" in
Shutdown)
  systemctl poweroff
  ;;
Reboot)
  systemctl reboot
  ;;
Lock)
  swaylock # replace with your lock program
  ;;
Suspend)
  systemctl suspend
  ;;
Logout)
  pkill -x mango
  ;;
*)
  exit 0
  ;;
esac
