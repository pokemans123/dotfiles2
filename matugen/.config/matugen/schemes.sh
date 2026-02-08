#!/usr/bin/env bash
choice=$(printf "default\ncontent: matches image content closely\nexpressive: vibrant hues\nfidelity: high image fidelity\nfruit-salad: multicolored accents\nmonochrome: greyscale tones\nneutral: muted,balanced\nrainbow: full spectrum" | rofi -dmenu -p "Change matugen scheme:")

# Extract just the keyword before the colon (or the whole string if no colon)
keyword=$(echo "$choice" | cut -d':' -f1)

case $keyword in
"default")
  matugen image $(cat ~/.config/mango/.wallpaper_current)
  ;;
"content")
  matugen image $(cat ~/.config/mango/.wallpaper_current) -t scheme-content
  ;;
"expressive")
  matugen image $(cat ~/.config/mango/.wallpaper_current) -t scheme-expressive
  ;;
"rainbow")
  matugen image $(cat ~/.config/mango/.wallpaper_current) -t scheme-rainbow
  ;;
"fidelity")
  matugen image $(cat ~/.config/mango/.wallpaper_current) -t scheme-fidelity
  ;;
"fruit-salad")
  matugen image $(cat ~/.config/mango/.wallpaper_current) -t scheme-fruit-salad
  ;;
"monochrome")
  matugen image $(cat ~/.config/mango/.wallpaper_current) -t scheme-monochrome
  ;;
"neutral")
  matugen image $(cat ~/.config/mango/.wallpaper_current) -t scheme-neutral
  ;;
esac
