## Path
fish_add_path ~/.local/bin

set -g fish_greeting # hide the welcome message

## Functions
# Show the cached weather from wttr.in on fish startup
# function fish_greeting
#     cat $HOME/.cache/wttr/current
# end

# Show time in fish command history
function history
    builtin history --show-time='%F %T '
end

# !! and !$ for fish - https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

## Variables
set -gx EDITOR nvim
set -gx VISUAL nvim
set -x MANROFFOPT "-c"
set -gx MANPAGER 'nvim +Man!'
# set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Set settings for done
set -g __done_min_cmd_duration 10000
set -g __done_notification_urgency_level low

## Colima
if test -S $HOME/.colima/default/docker.sock
    set -gx DOCKER_HOST unix://$HOME/.colima/default/docker.sock
    set -gx COMPOSE_BAKE true
end

## Homebrew
if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv) # add brew to PATH
end

if status is-interactive
    if test "$fish_key_bindings" = fish_vi_key_bindings
      bind -Minsert ! __history_previous_command
      bind -Minsert '$' __history_previous_command_arguments
    else
      bind ! __history_previous_command
      bind '$' __history_previous_command_arguments
    end

    ## Abbreviations / Aliases
    alias ...='cd ../..'
    alias ....='cd ../../..'
    abbr -a jctl 'journalctl -p 3 -xb'
    alias wget='wget -c '

    alias grep='grep --color=auto'

    # Git
    abbr -a g git
    abbr -a ga 'git add'
    abbr -a gaa 'git add --all'
    abbr -a gau 'git add --update'
    abbr -a gb 'git branch'
    abbr -a gbD 'git branch --delete --force'
    abbr -a gbd 'git branch --delete'
    abbr -a gc 'git commit --verbose'
    abbr -a gcB 'git checkout -B'
    abbr -a gcb 'git checkout -b'
    abbr -a gclean 'git clean --interactive -d'
    abbr -a gcm 'git checkout (git_main_branch)'
    abbr -a gco 'git checkout'
    abbr -a gd 'git diff'
    abbr -a gds 'git diff --staged'
    abbr -a gl 'git pull'
    abbr -a glgg 'git log --graph'
    abbr -a glgga 'git log --graph --decorate --all'
    abbr -a glgm 'git log --graph --max-count=10'
    abbr -a glo 'git log --oneline --decorate'
    abbr -a glog 'git log --oneline --decorate --graph'
    abbr -a gloga 'git log --oneline --decorate --graph --all'
    abbr -a glol 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
    abbr -a gmod "git status --porcelain | awk '{ print \$2 }'"
    abbr -a gp 'git push'
    abbr -a gpr 'git pull --rebase'
    abbr -a gpsup 'git push --set-upstream origin (git_current_branch)'
    abbr -a gst 'git status'

    # Lazy
    abbr -a lz lazygit
    abbr -a lzd lazydocker

    # ls / eza
    abbr -a ls eza
    abbr -a lsa 'eza --all'
    abbr -a lsl 'eza -lha --no-permissions --smart-group --time-style "relative"'
    abbr -a tree 'eza --tree'

    # Neovim
    abbr -a vi nvim
    abbr -a vim nvim
    abbr -a vimdiff 'nvim -d'

    # Pacman
    if type -q pacman
        abbr -a cleanup 'sudo pacman -Rns (pacman -Qtdq)'
    end

    starship init fish | source
    mise activate fish | source
    fzf --fish | source
    zoxide init fish | source
end
