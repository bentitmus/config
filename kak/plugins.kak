source "%val{config}/plugins/plug.kak/rc/plug.kak"
plug "andreyorst/powerline.kak" %{
  hook -once global WinCreate .* %{
    powerline-theme solarized-light-modified
  }
  hook global WinCreate .* %{
    powerline-separator none
    powerline-format bufname filetype mode_info position line_column session
  }
}
plug "andreyorst/fzf.kak"

