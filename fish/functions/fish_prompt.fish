function fish_prompt --description 'Write out the prompt'
  set __git_cb (set_color brown)(git branch ^/dev/null | grep \* | sed 's/* //')(set_color normal)"|"
  set -l dir (fish_prompt_dir $PWD)
  set -l __host_cb (fish_prompt_host)
  if [ $__host_cb != '' ]
    set __host_cb (set_color blue)"$__host_cb"(set_color normal)"|"
  end
  printf '%s%s%s%s%s> ' $__host_cb $__git_cb (set_color $fish_color_cwd) "$dir" (set_color normal)
end

