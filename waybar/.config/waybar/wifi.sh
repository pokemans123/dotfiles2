#!/bin/env bash

# Check if wifi is enabled
wifi_status=$(nmcli radio wifi)

if [ "$wifi_status" = "enabled" ]; then
  # WiFi is on - show networks and toggle option
  options="󰤭 Turn WiFi Off\n$(nmcli -t -f SSID,SIGNAL,SECURITY device wifi list | sed 's/\(.*\):\(.*\):\(.*\)/  \1 (\2%) \3/')"

  selected=$(echo -e "$options" | rofi -dmenu -i -p "WiFi Networks" -theme-str 'window {width: 400px;}')

  if [ -n "$selected" ]; then
    if [[ "$selected" == *"Turn WiFi Off"* ]]; then
      nmcli radio wifi off
      notify-send "WiFi" "Disabled" -i network-wireless-disabled -t 2000
    else
      # Extract SSID from selection (remove icon, signal, and security info)
      ssid=$(echo "$selected" | sed 's/^  \(.*\) ([0-9]*%) .*/\1/')
      nmcli device wifi connect "$ssid"
      notify-send "WiFi" "Connecting to $ssid..." -i network-wireless -t 2000
    fi
  fi
else
  # WiFi is off - show only toggle option
  selected=$(echo -e "󰤨 Turn WiFi On" | rofi -dmenu -i -p "WiFi Status")

  if [ -n "$selected" ]; then
    nmcli radio wifi on
    notify-send "WiFi" "Enabled" -i network-wireless-enabled -t 2000
  fi
fi
rfkill unblock all
