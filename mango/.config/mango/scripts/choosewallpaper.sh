#!/bin/env bash
DIR="$HOME/Pictures/wallpapers"
COLORS="$HOME/.config/wallust/theme.conf"
TERMINAL=kitty
WALLPAPER=$(
  yad --file \
    --title="Choose Wallpaper" \
    --filename="$DIR/" \
    --file-filter="Images | *.png *.jpg *.jpeg *.webp"
)
[ -z "$WALLPAPER" ] && exit 0
swww img "$WALLPAPER" \
  --transition-type grow \
  --transition-duration 0.6
echo "$WALLPAPER" >"$HOME/.config/mango/.wallpaper_current"
wallust run $WALLPAPER
wallust run -C ~/.config/wallust/wallust-kitty.toml $WALLPAPER
$HOME/.config/mango/scripts/reloadwaybar.sh
matugen image $(cat ~/.config/mango/.wallpaper_current)
pkill swaync
swaync &
$TERMINAL -e zsh -c "
echo 'Password is required to change SDDM wallpaper';
sudo cp -f \"$WALLPAPER\" /usr/share/sddm/themes/simple_sddm_2/Backgrounds/default;
sudo cp -f \"$COLORS\" /usr/share/sddm/themes/simple_sddm_2/theme.conf
echo 'SDDM wallpaper updated';
read -n 1 -s
"
