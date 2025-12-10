function git_current_branch --description 'Get the current git branch name'
    command git symbolic-ref --short HEAD 2>/dev/null
end
