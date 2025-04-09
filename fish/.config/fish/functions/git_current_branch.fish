function git_current_branch
  command git symbolic-ref --short HEAD 2>/dev/null
end
