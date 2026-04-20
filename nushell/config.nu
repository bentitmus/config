# config.nu
#
# Installed by:
# version = "0.112.2"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html

$env.XDG_DATA_HOME = "~/.local/share"
$env.XDG_CONFIG_HOME = "~/.config"
$env.XDG_CACHE_HOME = "~/.cache"

let selenized_theme = {
}

$env.config = {
  color_config: $selenized_theme
  show_banner: false
  buffer_editor: "kak"
  cursor_shape: {
    vi_insert: block
    vi_normal: block
    emacs: blink_line
  }
}

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

