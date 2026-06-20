function gen_fzf_default_opts
  set -l bg_0    "#fbf3db"
  set -l bg_1    "#ece3cc"
  set -l bg_2    "#d5cdb6"
  set -l dim_0   "#909995"
  set -l fg_0    "#53676d"
  set -l fg_1    "#3a4d53"

  set -l red     "#d2212d"
  set -l green   "#489100"
  set -l yellow  "#ad8900"
  set -l blue    "#0072d4"
  set -l magenta "#ca4898"
  set -l cyan    "#009c8f"
  set -l orange  "#c25d1e"
  set -l violet  "#8762c6"

  # Selenized light colour scheme for `fzf`
  set -xg FZF_DEFAULT_OPTS "
    --color fg:-1,bg:-1,hl:$blue,fg+:-1,bg+:$bg_1,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:-1,marker:-1,spinner:$yellow
  "
end
