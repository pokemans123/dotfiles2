#!/usr/bin/env bash
choice=$(printf "spaced\nunified\nwidebar\nisland" | rofi -dmenu -p "Waybar Layout")

case $choice in
"spaced")
  cp -f ~/.config/waybar/layouts/spaced/style.css ~/.config/waybar/style.css
  cp -f ~/.config/waybar/layouts/spaced/config.jsonc ~/.config/waybar/config.jsonc
  ;;
"unified")
  cp -f ~/.config/waybar/layouts/unified/style.css ~/.config/waybar/style.css
  cp -f ~/.config/waybar/layouts/unified/config.jsonc ~/.config/waybar/config.jsonc
  ;;
"widebar")
  cp -f ~/.config/waybar/layouts/widebar/style.css ~/.config/waybar/style.css
  cp -f ~/.config/waybar/layouts/widebar/config.jsonc ~/.config/waybar/config.jsonc
  ;;
"island")
  cp -f ~/.config/waybar/layouts/island/style.css ~/.config/waybar/style.css
  cp -f ~/.config/waybar/layouts/island/config.jsonc ~/.config/waybar/config.jsonc
  ;;
esac

pkill waybar
waybar &
