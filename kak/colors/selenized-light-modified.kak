####################
# SELENIZED LIGHT  #
####################
# theme by Jan Warchoł
# ported by TeddyDD
# modified by Benjamin Titmus

evaluate-commands %sh{

bg_0='rgb:fbf3db'
bg_1='rgb:ece3cc'
bg_2='rgb:d5cdb6'
dim_0='rgb:909995'
fg_0='rgb:53676d'
fg_1='rgb:3a4d53'

red='rgb:d2212d'
green='rgb:489100'
yellow='rgb:ad8900'
blue='rgb:0072d4'
magenta='rgb:ca4898'
cyan='rgb:009c8f'
orange='rgb:c25d1e'
violet='rgb:8762c6'

br_red='rgb:cc1729'
br_green='rgb:428b00'
br_yellow='rgb:a78300'
br_blue='rgb:006dce'
br_magenta='rgb:c44392'
br_cyan='rgb:00978a'
br_orange='rgb:bc5819'
br_violet='rgb:825dc0'

## code
echo "
set-face global value ${orange}+b
set-face global type ${br_orange}
set-face global variable ${magenta}
set-face global module ${green}
set-face global function ${br_cyan}
set-face global string ${green}
set-face global keyword ${violet}+b
set-face global operator ${br_cyan}
set-face global attribute ${orange}
set-face global comment ${dim_0}+i
set-face global meta ${br_orange}
set-face global builtin ${fg_0}+b
"

## markup
echo "
set-face global title ${blue}+u
set-face global header ${br_cyan}
set-face global bold ${br_orange}+b
set-face global italic ${orange}+i
set-face global mono ${green}
set-face global block ${orange}
set-face global link $blue
set-face global bullet ${br_magenta}
set-face global list ${magenta}
"

echo "
set-face global Default ${fg_0},${bg_0}
set-face global PrimarySelection ${fg_0},$bg_2
set-face global SecondarySelection $dim_0,$bg_1
set-face global PrimaryCursor $bg_1,$red
set-face global SecondaryCursor $bg_0,$cyan
set-face global MatchingChar $bg_1,$blue
set-face global Search $fg_1,$green
set-face global CurrentWord $dim_0,$blue

# when item focused in menu
set-face global MenuForeground $orange,$bg_2
# default bottom menu and autocomplete
set-face global MenuBackground $fg_0,$bg_1

set-face global Information $yellow,$bg_1
set-face global Error $bg_1,$red

set-face global BufferPadding $bg_1,$bg_0
set-face global Whitespace $bg_2
set-face global StatusLine $fg_0,$bg_1
set-face global StatusLineInfo $blue,$bg_1

set-face global LineNumbers $dim_0,$bg_1
set-face global LineNumberCursor default,default+r
"

}
