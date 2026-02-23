#!/usr/bin/env bash
TERMINAL=kitty #change to whatever your default terminal is
WALLPAPER=$(cat ~/.config/mango/.wallpaper_current)

$TERMINAL --app-id matugen-popup -e zsh -c "
     SUPER+q to abort
     matugen image $WALLPAPER -m dark
     swaync-client --reload-css;
     pkill -SIGUSR1 nautilus
     cp ~/.config/waybar/colors.css ~/.config/gtk-4.0/colors.css
     echo 'Done. Press enter to close.'
     read -n 1 -s
"
