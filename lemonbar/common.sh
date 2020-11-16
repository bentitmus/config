# Common variables and functions
export FONT_REGULAR="Valkyrie T4-14"
export FONT_ITALIC="$FONT_REGULAR:style=italic"

export COLOR_BG_0="#fbf3db"
export COLOR_BG_1="#ece3cc"
export COLOR_BG_2="#d5cdb6"
export COLOR_DIM_0="#909995"
export COLOR_FG_0="#53676d"
export COLOR_FG_1="#3a4d53"
export COLOR_RED="#d2212d"
export COLOR_GREEN="#489100"
export COLOR_YELLOW="#ad8900"
export COLOR_BLUE="#0072d4"
export COLOR_MAGENTA="#ca4898"
export COLOR_CYAN="#009c8f"
export COLOR_ORANGE="#c25d1e"
export COLOR_VIOLET="#8762c6"

b_left() {
  echo "%{l}"
}

b_right() {
  echo "%{r}"
}

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

