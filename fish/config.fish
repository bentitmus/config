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
  if not set -q modules_loaded
    source ~/.config-internal/module.fish

    module load core util swdev
    module load arm/cluster
    module load python/python/3.2

    set_vars
    set -xg modules_loaded 1
  end
end

function module
  load_modules
  module $argv
end

# Lazy load the module system and the given module when it is requested
# This speeds up shell startups
function lazy_module
  set -l proxy_command $argv[1]
  set -l proxy_mod $argv[2]
  function $argv[1] --inherit-variable proxy_command --inherit-variable proxy_mod
    module load $proxy_mod
    functions --erase $proxy_command
    command $proxy_command $argv
  end
end

lazy_module vim      vim/vim/8.1
lazy_module datasync arm/datasync/2.0
lazy_module xclip    xclip/xclip/0.12

function kak
  if set -q KAK_SESSION
    set -l private_kak_test (command kak -l | grep $KAK_SESSION)
    if test "$private_kak_test" = ""
      command kak -d -s $KAK_SESSION
    end
    command kak -c $KAK_SESSION $argv
  else
    command kak $argv
  end
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

