#! /bin/bash

TMP=$(mktemp /tmp/scnshot-XXX.png)
grim -g "$(slurp -w 0)" - | wl-copy && wl-paste > $TMP

ACTION=$(dunstify "$TMP" -i "$TMP" -a "Screenshot" -A "default,Open swappy")
if [[ "$ACTION" == "default" ]]; then
  swappy -f "$TMP"
fi
