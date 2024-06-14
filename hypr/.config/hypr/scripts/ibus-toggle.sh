#!/bin/sh
if ibus engine | grep "ml" >/dev/null; then
    ibus engine xkb:us::eng
    notify-send "switched to english"
else
    ibus engine varnam-ml
    notify-send "switched to malayalam"
fi
