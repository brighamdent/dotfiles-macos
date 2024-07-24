#!/bin/bash

COVER="/tmp/cover.jpg"

kitty icat "$COVER"

function add_cover {
  kitty icat "$COVER"
}

if [ ! -f "$COVER" ]; then
  cp "$HOME/.config/ncmpcpp/default_cover.png" "$COVER"
fi

while inotifywait -q -q -e close_write "$COVER"; do
  add_cover
done
