# Ensure that we use the platform specific paths
. ~/.config-internal/paths.sh

export LD_LIBRARY_PATH=$GCC_PATH:$LD_LIBRARY_PATH
export SHELL=$FISH_SHELL
export LC_ALL=en_GB.utf8
export LANG=en_GB.utf8
export PATH=$LOCAL_PATH:$PATH

