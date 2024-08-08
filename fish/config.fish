if test -d /opt/homebrew
  set -xg LOCAL_PATH /opt/homebrew/bin
else
  set -xg LOCAL_PATH /usr/local/sbin
end
set -xg LOCAL_PATH $LOCAL_PATH /usr/local/bin /sbin
if test -d /Applications/Racket\ v7.9.0.17/bin
  set -xg LOCAL_PATH $LOCAL_PATH /Applications/Racket\ v7.9.0.17/bin
end
if test -d ~/.local/bin
  set -xg LOCAL_PATH $LOCAL_PATH ~/.local/bin
end

# XDG directories
set -xg XDG_DATA_HOME $HOME/.local/share
set -xg XDG_CONFIG_HOME $HOME/.config
set -xg XDG_CACHE_HOME $HOME/.cache

fish_add_path /bin
fish_add_path $LOCAL_PATH
fish_add_path /usr/bin
fish_add_path ~/bin
fish_add_path $HOME/.cargo/bin
fish_add_path /Users/ben/.nuget/packages/runtime.osx-arm64.microsoft.netcore.ilasm/7.0.0/runtimes/osx-arm64/native
fish_add_path /Users/ben/.nuget/packages/runtime.osx-arm64.microsoft.netcore.ildasm/7.0.0/runtimes/osx-arm64/native
fish_add_path $HOME/.dotnet/tools
fish_add_path $HOME/Applications/uxn
fish_add_path /opt/homebrew/opt/postgresql@16/bin

set -xg TEXINPUTS /opt/homebrew/Cellar/noweb/2.13/tex/generic/noweb:

set -g fisher_path $XDG_CONFIG_HOME/fish/fisher

set -p fish_function_path fish_function_path[1] $fisher_path/functions
set -p fish_complete_path fish_complete_path[1] $fisher_path/completions

for file in $fisher_path/conf.d/*.fish
  builtin source $file 2>/dev/null
end

function kak
  if set -q KAK_SESSION
    set -l private_kak_test (command kak -l | grep $KAK_SESSION)
    if test "$private_kak_test" = ""
      command setsid kak -d -s $KAK_SESSION
    end
    command kak -c $KAK_SESSION $argv
  else
    command kak $argv
  end
end

alias R "R --no-save -q"
alias hc herbstclient

# Some local set-up might mess with these variables, so make them easily 're-loadable'
function set_vars
  set -xg EDITOR kak
  if [ (uname) = "Darwin" ]
    set -xg LANG en_GB.UTF-8
    set -xg LC_ALL en_GB.UTF-8
  else
    set -xg LANG en_US.UTF-8
    set -xg LC_ALL en_US.UTF-8
  end
  set -xg TZ Europe/London
  set -xg LD_LIBRARY_PATH $GCC_PATH:$LD_LIBRARY_PATH
  set -xg TMUXP_CONFIGDIR ~/.config-internal/tmuxp
  set -xg FZF_DEFAULT_OPTS "--color=light"

  set -xg SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket 2>/dev/null)

  set -xg VIMINIT "source $XDG_CONFIG_HOME/vim/vimrc"
  set -xg TASKRC $XDG_CONFIG_HOME/task/taskrc
  set -xg TIMEWARRIORDB $XDG_CONFIG_HOME/timew
  set -xg LESSKEY $XDG_CONFIG_HOME/less/keys
  set -xg R_ENVIRON_USER $XDG_CONFIG_HOME/R/Renviron
  set -xg R_PROFILE_USER $XDG_CONFIG_HOME/R/Rprofile
  set -xg PASSWORD_STORE_DIR $XDG_DATA_HOME/password-store
  set -xg TEXMFHOME $XDG_DATA_HOME/texmf
  set -xg TEXMFVAR $XDG_CACHE_HOME/texlive/texmf-var
  set -xg TEXMFCONFIG $XDG_CONFIG_HOME/texlive/texmf-config
  set -xg GOPATH $XDG_DATA_HOME/go

  set -xg DOTNET_ROOT /opt/homebrew/Cellar/dotnet/7.0.100/libexec
  #set -xg DOTNET_ROOT /usr/local/share/dotnet/x64/sdk/5.0.408

  # Homebrew set-up
  if [ (uname) = "Linux" ]
    set -xg HOMEBREW_CACHE $HOMEBREW_BASE/cache
    set -xg HOMEBREW_TEMP $HOMEBREW_BASE/tmp
    set -gx HOMEBREW_PREFIX "$HOMEBREW_BASE/install";
    set -gx HOMEBREW_CELLAR "$HOMEBREW_BASE/install/Cellar";
    set -gx HOMEBREW_REPOSITORY "$HOMEBREW_BASE/install/Homebrew";
    set -g fish_user_paths "$HOMEBREW_BASE/install/bin" "$HOMEBREW_BASE/install/sbin" $fish_user_paths;
    set -q MANPATH; or set MANPATH ''; set -gx MANPATH "$HOMEBREW_BASE/install/share/man" $MANPATH;
    set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "$HOMEBREW_BASE/install/share/info" $INFOPATH;
  end
end

set_vars

if type -q gdircolors
  eval (gdircolors -c ~/.config/dircolors)
else
  eval (dircolors -c ~/.config/dircolors)
end

fish_add_path $(go env GOPATH)/bin

