function git_main_branch --description 'Detect name of main branch of current git repository'
    command git rev-parse --git-dir >/dev/null 2>&1 || return
    for ref in refs/{heads,remotes/{origin,upstream}}/{main,master,trunk}
        if command git show-ref -q --verify $ref
            echo (string split -r -m1 -f2 / $ref)
            return
        end
    end
    echo main
end
