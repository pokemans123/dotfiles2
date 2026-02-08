#!/bin/env bash
TERMINAL=kitty
$TERMINAL -e zsh -c "
echo 'Enter your password to update your system:';
yay --noconfirm
flatpak update -y
echo 'System updated succesfully. Press Enter to close'
read -n 1 -s
"
