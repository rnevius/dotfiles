function h --description 'help / man, with syntax highlighting'
    if test (count $argv) -eq 0
        echo "usage: h <command>"
        return 1
    end

    # Check if manpage exists
    if man -w $argv[1] >/dev/null 2>&1
        man $argv[1]
        return
    end

    # Fall back to --help
    command $argv[1] --help 2>&1 | bat -l help -p
end
