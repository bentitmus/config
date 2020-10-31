function fish_prompt_dir --description 'Local shortening of the prompt'
  set -l dir $argv[1]

  # Replace $HOME with "~"
  set realhome ~
  set dir (string replace -r '^'"$realhome"'($|/)' '~$1' $dir)
  set dir (string replace -ar '(\.?[^/])[^/]*/' '$1/' $dir)
  
  if not [ -n "$dir" ]
    set dir "/"
  end

  echo $dir
end
