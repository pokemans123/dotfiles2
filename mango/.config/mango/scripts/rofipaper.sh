#!/usr/bin/env bash
DIR="$HOME/Pictures/wallpapers"
IMAGE_PICKER_CONFIG="$HOME/.config/rofi/image-picker.rasi"
FILES=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \))
ROFI_MENU=""

# Build the rofi menu with icon support
while IFS= read -r WALLPAPER_PATH; do
  WALLPAPER_NAME=$(basename "$WALLPAPER_PATH")
  ROFI_MENU+="${WALLPAPER_NAME}\0icon\x1f${WALLPAPER_PATH}\n"
done <<<"$FILES"

# Launch rofi
CHOSEN_WALLPAPER=$(echo -e "$ROFI_MENU" | rofi -dmenu \
  -p "Select Wallpaper:" \
  -theme "$IMAGE_PICKER_CONFIG" \
  -markup-rows \
  -show-icons)

# Exit if nothing was selected
[ -z "$CHOSEN_WALLPAPER" ] && exit 0

# Extract full path safely
if [[ "$CHOSEN_WALLPAPER" == *$'\x1f'* ]]; then
  WALLPAPER=$(echo -e "$CHOSEN_WALLPAPER" | cut -d $'\x1f' -f2)
else
  # fallback if rofi returns only the display name
  WALLPAPER="$DIR/$CHOSEN_WALLPAPER"
fi

[ -z "$WALLPAPER" ] && exit 0

# Apply wallpaper
swww img "$WALLPAPER" --transition-type grow --transition-duration 0.6
echo "$WALLPAPER" >"$HOME/.config/mango/.wallpaper_current"
matugen image "$WALLPAPER" -t scheme-content -m dark

swaync-client --reload-css

# Update SDDM
TERMINAL=kitty
COLORS="$HOME/.config/wallust/theme.conf"
$TERMINAL -e zsh -c "
echo 'Password is required to change SDDM wallpaper';
sudo cp -f \"$WALLPAPER\" /usr/share/sddm/themes/silent/backgrounds/default;
echo 'SDDM wallpaper updated';
read -n 1 -s
"
