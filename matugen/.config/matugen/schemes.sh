#!/usr/bin/env bash
TERMINAL=kitty #change to whatever your default terminal is
WALLPAPER=$(cat ~/.config/mango/.wallpaper_current)

$TERMINAL --app-id matugen-popup -e zsh -c "
     SUPER+q to abort
     matugen image $WALLPAPER -m dark
     echo 'Done. Press any key to close.'
     read -n 1 -s
"
