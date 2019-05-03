# Expects
#   0: project name
#   1: project directory
function setup-project
  set -xg project_name $argv[1]
  set -xg project_base_dir $argv[2]
  set -xg KAK_SESSION $argv[1]
  cd $project_base_dir
end

