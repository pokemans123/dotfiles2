#!/usr/bin/env bash
DIR="$HOME/Pictures/wallpapers"
IMAGE_PICKER_CONFIG="$HOME/.config/rofi/image-picker.rasi"
FILES=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \))
ROFI_MENU=""

while IFS= read -r WALLPAPER_PATH; do
  WALLPAPER_NAME=$(basename "$WALLPAPER_PATH")
  ROFI_MENU+="${WALLPAPER_NAME}\0icon\x1f${WALLPAPER_PATH}\n"
done <<<"$FILES"

CHOSEN_WALLPAPER=$(echo -e "$ROFI_MENU" | rofi -dmenu -i \
  -p "Select Wallpaper:" \
  -theme "$IMAGE_PICKER_CONFIG" \
  -markup-rows \
  -show-icons)

[ -z "$CHOSEN_WALLPAPER" ] && exit 0

if [[ "$CHOSEN_WALLPAPER" == *$'\x1f'* ]]; then
  WALLPAPER=$(echo -e "$CHOSEN_WALLPAPER" | cut -d $'\x1f' -f2)
else
  WALLPAPER="$DIR/$CHOSEN_WALLPAPER"
fi

[ -z "$WALLPAPER" ] && exit 0

swww img "$WALLPAPER" --transition-type grow --transition-duration 0.6
echo "$WALLPAPER" >"$HOME/.config/mango/.wallpaper_current"

TERMINAL=kitty

# Single terminal handles matugen (interactive), swaync reload, and SDDM update
$TERMINAL --app-id rofipaper -e zsh -c "
  echo '==> Generating color scheme...';
  matugen image \"$WALLPAPER\" -t scheme-content -m dark;
  echo '';
  pkill -SIGUSR1 kitty
  echo '==> Reloading SwayNC CSS...';
  swaync-client --reload-css;
  echo '';
  echo '==> Password required to update SDDM wallpaper:';
  sudo cp -f \"$WALLPAPER\" /usr/share/sddm/themes/silent/backgrounds/default;
  echo 'Done. Press any key to close.';
  read -n 1 -s
"
