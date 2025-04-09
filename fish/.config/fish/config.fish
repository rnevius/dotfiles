eval "$(/opt/homebrew/bin/brew shellenv)" # add brew to PATH

set -g fish_greeting # hide the welcome message
set -gx EDITOR nvim
set -gx VISUAL nvim

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Abbreviations / Aliases
## Docker
abbr -a dce 'docker compose exec'

## Git
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
abbr -a gpsup 'git push --set-upstream origin $(git_current_branch)'
abbr -a gst 'git status'

## Lazy
abbr -a lz lazygit
abbr -a lzd lazydocker

abbr -a ls eza
abbr -a tree 'eza --tree'
abbr -a vi nvim
abbr -a vim nvim
abbr -a vimdiff 'nvim -d'

starship init fish | source
fzf --fish | source
zoxide init fish | source
