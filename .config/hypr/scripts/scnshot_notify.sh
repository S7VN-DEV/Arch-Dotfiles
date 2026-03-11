#!/bin/bash

SLURP=$(slurp -w 0) || exit 0
TMP=$(mktemp /tmp/scnshot-XXX.png)
grim -g "$SLURP" "$TMP" && wl-copy < "$TMP"

ACTION=$(dunstify "$TMP" -i "$TMP" -a "Screenshot" -A "default,Open swappy")
[[ "$ACTION" == "default" ]] && swappy -f "$TMP"
