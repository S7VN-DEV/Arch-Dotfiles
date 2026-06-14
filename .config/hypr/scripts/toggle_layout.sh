#!/bin/bash
# Layout switcher, need to make custom pngs for this later

mkdir -p /tmp/icons
if [ ! -f /tmp/icons/dwindle.png ]; then
  curl -L "https://cdn-icons-png.flaticon.com/512/4211/4211659.png" -o /tmp/icons/dwindle.png
fi
if hyprctl getoption general:layout | grep -q "dwindle"; then
  hyprctl eval 'hl.config({ general = { layout = "scrolling" } })'
  dunstify "Scrolling" -a "Layout" -r 67 -i /tmp/icons/dwindle.png
else
  hyprctl eval 'hl.config({ general = { layout = "dwindle" } })'
  dunstify "Dwindle" -a "Layout" -r 67 -i /tmp/icons/dwindle.png
fi
