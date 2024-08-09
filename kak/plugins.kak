source "%val{config}/plugins/plug.kak/rc/plug.kak"
plug "andreyorst/plug.kak" noload
plug "TeddyDD/kakoune-selenized" theme
plug "andreyorst/powerline.kak" defer powerline %{
  set-option global powerline_format 'bufname filetype mode_info position line_column session'
  set-option global powerline_separator ''
  set-option global powerline_separator_thin ''
} config %{
  powerline-start
}
plug "kakoune-lsp/kakoune-lsp" do %{
  cargo install --locked --force --path .
}
plug "andreyorst/fzf.kak" defer fzf %{
#  set-option global fzf_default_opts '--color=light'
}
plug chambln/kakoune-readline config %{
  map global insert <tab> <c-n>
  map global insert <s-tab> <c-p>
  map global insert <c-p> <up>
  map global insert <c-n> <down>
  hook global WinCreate .* readline-enable
}
plug "https://git.sr.ht/~hadronized/kak-tree-sitter" noload do %{
  cargo install kak-tree-sitter
  cargo install ktsctl
  ktsctl sync awk
  ktsctl sync bash
  ktsctl sync jq
  ktsctl sync julia
} config %sh{
  kak-tree-sitter -dks --init $kak_session
}

