# kitty completion
if command -v kitty > /dev/null 2>&1; then
  kitty + complete setup zsh | source /dev/stdin
fi

autoload -Uz compinit && compinit
# zstyle ':completion:*' menu select
_comp_options+=(globdots)  # With hidden files

# Zsh conf
export HISTFILE="$HOME/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# Colima + Docker
export COMPOSE_BAKE=true
export DOCKER_HOST=$(colima status --json | jq -r '.docker_socket')

# man
export MANPAGER="nvim +Man!"
export MANWIDTH=999

export BAT_PAGER="less -RF"
export BAT_STYLE="plain"
export BAT_THEME="OneHalfDark"

# editor
export VISUAL="nvim"
export EDITOR="$VISUAL"

# aliases
alias ..='cd ../'
alias ...='cd ../..'
function -() {
  cd -
}
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gc='git commit --verbose'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcB='git checkout -B'
alias gcm='git checkout $(git_main_branch)'
alias gclean='git clean --interactive -d'
alias gd='git diff'
alias gds='git diff --staged'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glol='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias gl='git pull'
alias gp='git push'
alias gpr='git pull --rebase'
# alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gmod="git status --porcelain | awk '{ print \$2 }'"
alias gst='git status'

alias lz="lazygit"
alias lzd="lazydocker"
alias tree="eza --tree"
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"

# open the git remote in a browser
gopen() {
  open $(git config --get remote.origin.url | sed -e 's/:/\//g' | sed -e 's/ssh\/\/\///g' | sed -e 's/git@/https:\/\//g')
}

# use fzf+jq as a quasi-repl for any command that outputs JSON
# e.g. `jqrepl 'cat some.json'`
jqrepl() {
  echo '' | fzf --print-query --preview "$@ | jq {q}"
}

# FZF
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git"
source <(fzf --zsh)

# Homebrew
# export HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -s 'Homebrew GitHub Token' -w)

# OpenAI
# export OPENAI_API_KEY=$(security find-generic-password -s 'OpenAI API Key' -w)
# OpenRouter
# export OPENROUTER_API_KEY=$(security find-generic-password -s 'OpenRouter API Key' -w)

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
