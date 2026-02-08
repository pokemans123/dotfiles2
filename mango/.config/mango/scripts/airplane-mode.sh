#!/bin/env bash
STATE_FILE="/tmp/airplane-mode-state"

if [ -f "$STATE_FILE" ]; then #checks if airplane mode is currently enabled; turns it off
  rfkill unblock all
  rm "$STATE_FILE"
  notify-send "Airplane Mode" "Disabled" -a "Airplane Mode"
else
  rfkill block all
  touch "$STATE_FILE"
  notify-send "Airplane Mode" "Enabled" -a "Airplane Mode"
fi
