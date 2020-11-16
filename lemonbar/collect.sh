#!/bin/bash
format="$1"
files=("${@:2}")

for i in "${!files[@]}"; do
  while IFS="" read -r line; do
    echo "$i $line"
  done < "${files[$i]}" &
done | while IFS="" read -r line; do
  last_lines[${line%% *}]="${line#* }"
  printf "$format" "${last_lines[@]}"
done

