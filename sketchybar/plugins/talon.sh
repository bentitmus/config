#!/bin/sh

TALON_ICON=" "
TRACKING_ICON=" "

if [ -z ${TALON+x} ]; then
  TALON_ICON=""
  sketchybar --set "$NAME" label.drawing="off"
else
  sketchybar --set "$NAME" label="$TALON" label.drawing="on"
fi
if [ -z ${TRACKING+x} ]; then
  TRACKING_ICON=""
fi

sketchybar --set "$NAME" icon="$TRACKING_ICON$TALON_ICON"

