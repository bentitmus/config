#!/bin/bash

. common.sh

format() {
  herbstclient tag_status | sed -e "s/\t/\n/g" | sed -e "
    /^$/d
    /^\./d
    s/^#\([0-9]\+\):\(.*\)$/$(b_tag_sel_reg) \1$(b_tag_sel_dim)[$(b_font_italic)\2$(b_font_reg)] $(b_tag_non_reg)/
    s/^:\([0-9]\+\):\(.*\)$/$(b_tag_non_reg) \1$(b_tag_non_dim)[$(b_font_italic)\2$(b_font_reg)] /
    s/^#\([^:]\+\)$/$(b_tag_sel_reg) \1 $(b_tag_non_reg)/
    s/^:\([^:]\+\)$/$(b_tag_non_reg) \1 /
    " -E | tr -d '\n' | sed -e "s/$/\n/"
}

format

herbstclient -i | while read -r; do
  format
done
