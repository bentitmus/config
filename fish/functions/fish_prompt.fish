function fish_prompt --description 'Write out the prompt'
  if not set -q __git_cb
    set __git_cb (set_color brown)(git branch ^/dev/null | grep \* | sed 's/* //')(set_color normal)"|"
  end
  set -l dir (prompt_pwd)
  set -l __project_cb
  if not [ -n "$dir" ]
    set dir "/"
  end
  if set -q project_base_dir
    set __project_cb (set_color blue)"$project_name"(set_color normal)"|"
  end

  printf '%s%s%s%s%s> ' $__project_cb $__git_cb (set_color $fish_color_cwd) "$dir" (set_color normal)
end

