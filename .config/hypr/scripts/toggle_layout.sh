# Layout switcher, need to make custom pngs for this later

mkdir -p /tmp/icons
if [ ! -f /tmp/icons/dwindle.png ]; then
  curl -L "https://cdn-icons-png.flaticon.com/512/4211/4211659.png" -o /tmp/icons/dwindle.png
fi
if hyprctl getoption general:layout | grep "dwindle"; then
  hyprctl keyword general:layout "scrolling"
  dunstify "Scrolling" -a "Layout" -r 67 -i /tmp/icons/dwindle.png
elif hyprctl getoption general:layout | grep "scrolling"; then
  dunstify "Dwindle" -a "Layout" -r 67 -i /tmp/icons/dwindle.png
  hyprctl keyword general:layout "dwindle"
fi


