#!/bin/env bash
systemctl --user start wireplumber
systemctl --user set-environment XDG_CURRENT_DESKTOP=wlroots
systemctl --user import-environment WAYLAND_DISPLAY
systemctl --user start xdg-desktop-portal-wlr.service
nm-applet --indicator &
blueman-applet &
swaync &
WALLPAPER=$(cat "$HOME/.config/mango/.wallpaper_current")
swww-daemon &

[ -n "$WALLPAPER" ] && swww img "$WALLPAPER" &

waybar &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
