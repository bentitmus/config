source ~/.config-internal/paths.fish

set -xg PATH /bin /usr/bin $LOCAL_PATH ~/bin

function read_display --on-event fish_preexec
  set -xg DISPLAY (cat ~/etc/display)
end

# Base16 Shell
set BASE16_SHELL "$HOME/.config/build/base16-shell/"
if status --is-interactive
  source "$BASE16_SHELL/profile_helper.fish"
end

set -xg XDG_CONFIG_HOME ~/.config

function load_modules
  source ~/.config-internal/module.fish

  module load core util swdev
  module load arm/cluster
  module load vim/vim/8.1
  module load arm/datasync/2.0
  module load python/python/3.2
  module load xclip/xclip/0.12

  set_vars
end

function module
  load_modules

  module $argv
end

function vim
  load_modules
  functions --erase vim
  vim $argv
end

# Loading the module system might mess up the variables, so reset them if we load modules
function set_vars
  set -xg EDITOR vim
  set -xg VIMINIT "source $XDG_CONFIG_HOME/vim/vimrc"
  set -xg TASKRC $XDG_CONFIG_HOME/task/taskrc
  set -xg TIMEWARRIORDB $XDG_CONFIG_HOME/timew
  set -xg LANG en_US.utf8
  set -xg LC_ALL en_US.utf8
  set -xg LD_LIBRARY_PATH $GCC_PATH:$LD_LIBRARY_PATH
  set -xg TMUXP_CONFIGDIR ~/.config-internal/tmuxp
  set -xg FZF_DEFAULT_OPTS "--color=light"

  # Homebrew set-up
  set -xg HOMEBREW_CACHE $HOMEBREW_BASE/cache
  set -xg HOMEBREW_TEMP $HOMEBREW_BASE/tmp
  set -gx HOMEBREW_PREFIX "$HOMEBREW_BASE/install";
  set -gx HOMEBREW_CELLAR "$HOMEBREW_BASE/install/Cellar";
  set -gx HOMEBREW_REPOSITORY "$HOMEBREW_BASE/install/Homebrew";
  set -g fish_user_paths "$HOMEBREW_BASE/install/bin" "$HOMEBREW_BASE/install/sbin" $fish_user_paths;
  set -q MANPATH; or set MANPATH ''; set -gx MANPATH "$HOMEBREW_BASE/install/share/man" $MANPATH;
  set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "$HOMEBREW_BASE/install/share/info" $INFOPATH;
end

set_vars

