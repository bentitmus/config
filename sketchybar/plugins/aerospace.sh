#!/bin/sh

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" drawing=on background.color=0xff489100 icon.color=0xfffbf3db label.color=0xfffbf3db
else
  windows=$(aerospace list-windows --workspace $1 --count)
  display="on"
  if [ $windows = 0 ]; then
    display="off"
  fi
  sketchybar --set "$NAME" drawing=$display background.color=0xfffbf3db icon.color=0xff53676d label.color=0xff53676d
fi
