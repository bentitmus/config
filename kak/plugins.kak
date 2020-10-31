source "%val{config}/plugins/plug.kak/rc/plug.kak"
plug "TeddyDD/kakoune-selenized" domain "GitHub.com" theme
plug "jdugan6240/powerline.kak" defer powerline %{
  set-option global powerline_format 'bufname filetype mode_info position line_column session'
  set-option global powerline_separator ''
  set-option global powerline_separator_thin ''
} config %{
  powerline-start
}
plug "andreyorst/fzf.kak" defer fzf %{
  set-option global fzf_default_opts '--color=light'
}
plug "TeddyDD/kakoune-lf"
plug chambln/kakoune-readline config %{
  map global insert <tab> <c-n>
  map global insert <s-tab> <c-p>
  map global insert <c-p> <up>
  map global insert <c-n> <down>
  hook global WinCreate .* readline-enable
}

