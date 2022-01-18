#!/bin/sh

export COLOR_BG_0="#fbf3db"
export COLOR_BG_2="#d5cdb6"
export COLOR_DIM_0="#909995"
export COLOR_FG_0="#53676d"
export COLOR_GREEN="#489100"

b_font_reg() {
  echo "%{T1}"
}

b_font_italic() {
  echo "%{T2}"
}

b_tag_non_reg() {
  echo "%{B$COLOR_BG_0}%{F$COLOR_FG_0}"
}

b_tag_non_dim() {
  echo "%{F$COLOR_DIM_0}"
}

b_tag_sel_reg() {
  echo "%{B$COLOR_GREEN}%{F$COLOR_BG_0}"
}

b_tag_sel_dim() {
  echo "%{F$COLOR_BG_2}"
}

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

IFS="$(printf '\t')" herbstclient --idle | while read -r hook args; do
	case "$hook" in
	tag*)
		format
		;;
	esac
done

