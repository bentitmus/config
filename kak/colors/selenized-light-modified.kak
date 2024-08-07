####################
# SELENIZED LIGHT  #
####################
# theme by Jan Warchoł
# ported by TeddyDD
# modified by Benjamin Titmus

declare-option str bg_0       "rgb:fbf3db"
declare-option str bg_1       "rgb:ece3cc"
declare-option str bg_2       "rgb:d5cdb6"
declare-option str dim_0      "rgb:909995"
declare-option str fg_0       "rgb:53676d"
declare-option str fg_1       "rgb:3a4d53"

declare-option str red        "rgb:d2212d"
declare-option str green      "rgb:489100"
declare-option str yellow     "rgb:ad8900"
declare-option str blue       "rgb:0072d4"
declare-option str magenta    "rgb:ca4898"
declare-option str cyan       "rgb:009c8f"
declare-option str orange     "rgb:c25d1e"
declare-option str violet     "rgb:8762c6"

declare-option str br_red     "rgb:cc1729"
declare-option str br_green   "rgb:428b00"
declare-option str br_yellow  "rgb:a78300"
declare-option str br_blue    "rgb:006dce"
declare-option str br_magenta "rgb:c44392"
declare-option str br_cyan    "rgb:00978a"
declare-option str br_orange  "rgb:bc5819"
declare-option str br_violet  "rgb:825dc0"

## code
set-face global value            "%opt{orange}+b"
set-face global type             "%opt{br_orange}"
set-face global variable         "%opt{magenta}"
set-face global module           "%opt{green}"
set-face global function         "%opt{br_cyan}"
set-face global string           "%opt{green}"
set-face global keyword          "%opt{violet}+b"
set-face global operator         "%opt{br_cyan}"
set-face global attribute        "%opt{orange}"
set-face global comment          "%opt{dim_0}+i"
set-face global meta             "%opt{br_orange}"
set-face global builtin          "%opt{fg_0}+b"

## markup
set-face global title            "%opt{blue}+u"
set-face global header           "%opt{br_cyan}"
set-face global bold             "%opt{br_orange}+b"
set-face global italic           "%opt{orange}+i"
set-face global mono             "%opt{green}"
set-face global block            "%opt{orange}"
set-face global link             "%opt{blue}"
set-face global bullet           "%opt{br_magenta}"
set-face global list             "%opt{magenta}"

set-face global Default          "%opt{fg_0},%opt{bg_0}"
set-face global PrimarySelection "%opt{fg_0},%opt{bg_2}"
set-face global SecondarySelection "%opt{dim_0},%opt{bg_1}"
set-face global PrimaryCursor    "%opt{bg_1},%opt{red}"
set-face global SecondaryCursor  "%opt{bg_0},%opt{cyan}"
set-face global MatchingChar     "%opt{bg_1},%opt{blue}"
set-face global Search           "%opt{fg_1},%opt{green}"
set-face global CurrentWord      "%opt{dim_0},%opt{blue}"

# when item focused in menu
set-face global MenuForeground   "%opt{orange},%opt{bg_2}"
# default bottom menu and autocomplete
set-face global MenuBackground   "%opt{fg_0},%opt{bg_1}"

set-face global Information      "%opt{yellow},%opt{bg_1}"
set-face global Error            "%opt{bg_1},%opt{red}"

set-face global BufferPadding    "%opt{bg_1},%opt{bg_0}"
set-face global Whitespace       "%opt{bg_2}"
set-face global StatusLine       "%opt{fg_0},%opt{bg_1}"
set-face global StatusLineInfo   "%opt{blue},%opt{bg_1}"

set-face global LineNumbers      "%opt{dim_0},%opt{bg_1}"
set-face global LineNumberCursor "default,default+r"

## code
set-face global value            "%opt{orange}+b"
set-face global type             "%opt{br_orange}"
set-face global variable         "%opt{magenta}"
set-face global module           "%opt{green}"
set-face global function         "%opt{br_cyan}"
set-face global string           "%opt{green}"
set-face global keyword          "%opt{violet}+b"
set-face global operator         "%opt{br_cyan}"
set-face global attribute        "%opt{orange}"
set-face global comment          "%opt{dim_0}+i"
set-face global meta             "%opt{br_orange}"
set-face global builtin          "%opt{fg_0}+b"

## Tree-sitter (<https://git.sr.ht/~hadronized/kak-tree-sitter>)
set-face global ts_attribute                    "%opt{orange}"
set-face global ts_comment                      "%opt{dim_0}+i"
#set-face global ts_conceal                      "%opt{mauve}+i"
#set-face global ts_constant                     "%opt{orange}"
#set-face global ts_constructor                  "%opt{cyan}"
#set-face global ts_diff_plus                    "%opt{green}"
#set-face global ts_diff_minus                   "%opt{red}"
#set-face global ts_diff_delta                   "%opt{blue}"
#set-face global ts_error                        "%opt{red}+b"
set-face global ts_function                     "%opt{br_cyan}"
#set-face global ts_hint                         "%opt{blue}+b"
#set-face global ts_info                         "%opt{green}+b"
set-face global ts_keyword                      "%opt{violet}+b"
#set-face global ts_label                        "%opt{cyan}+i"
#set-face global ts_markup_bold                  "%opt{orange}+b"
#set-face global ts_markup_heading               "%opt{red}"
#set-face global ts_markup_italic                "%opt{pink}+i"
#set-face global ts_markup_list_checked          "%opt{green}"
#set-face global ts_markup_list_numbered         "%opt{blue}+i"
#set-face global ts_markup_list_unchecked        "%opt{teal}"
#set-face global ts_markup_list_unnumbered       "%opt{mauve}"
#set-face global ts_markup_link_label            "%opt{blue}"
#set-face global ts_markup_link_url              "%opt{teal}+u"
#set-face global ts_markup_link_uri              "%opt{teal}+u"
#set-face global ts_markup_link_text             "%opt{blue}"
#set-face global ts_markup_quote                 "%opt{gray1}"
#set-face global ts_markup_raw                   "%opt{green}"
#set-face global ts_markup_strikethrough         "%opt{gray1}+s"
#set-face global ts_namespace                    "%opt{blue}+i"
set-face global ts_operator                     "%opt{br_cyan}"
#set-face global ts_property                     "%opt{sky}"
#set-face global ts_punctuation                  "%opt{overlay1}"
#set-face global ts_special                      "%opt{blue}"
#set-face global ts_spell                        "%opt{mauve}"
set-face global ts_string                       "%opt{green}"
#set-face global ts_tag                          "%opt{mauve}"
#set-face global ts_tag_error                    "%opt{red}"
#set-face global ts_text                         "%opt{white}"
set-face global ts_type                         "%opt{br_orange}"
set-face global ts_variable                     "%opt{magenta}"
#set-face global ts_warning                      "%opt{orange}+b"

