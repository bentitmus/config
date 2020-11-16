#!/bin/bash

trap "kill 0" EXIT
cd "${0%/*}"

. common.sh

./collect.sh "%%{l}%s%%{r}%s   %s \n" <(./tags.sh) <(./clock.sh) <(./hostname.sh) |
  lemonbar -p -b -o -2 -u 2 -F $COLOR_FG_0 -B $COLOR_BG_0 -f "$FONT_REGULAR" -f "$FONT_ITALIC"

