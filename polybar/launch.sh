#!/bin/sh

. /arm/tools/setup/init/sh
module load swdev gnu/gcc/9.3.0 herbstluftwm/herbstluftwm/0.8.3
export LD_LIBRARY_PATH=/home/bentit01/.local/lib:$LD_LIBRARY_PATH
export PATH=/home/bentit01/.local/bin:$PATH
polybar default
