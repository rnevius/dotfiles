# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=/usr/local/bin:/usr/local/opt/ruby/bin:$PATH

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git poetry z)
source $ZSH/oh-my-zsh.sh

# kitty completion
if command -v kitty > /dev/null 2>&1; then
  kitty + complete setup zsh | source /dev/stdin
fi

# Colima + Docker
export COMPOSE_BAKE=true
export DOCKER_HOST=$(colima status --json | jq -r '.docker_socket')
# man
export MANPAGER="nvim +Man!"
export MANWIDTH=999

export BAT_PAGER="less --"
export BAT_STYLE="plain"
export BAT_THEME="OneHalfDark"

# editor
export VISUAL="nvim"
export EDITOR="$VISUAL"

# aliases
alias gmod="git status --porcelain | awk '{ print \$2 }'"
alias lz="lazygit"
alias lzd="lazydocker"
alias tree="fd --hidden --exclude .git | tree --fromfile "
alias v="nvim -S Session.vim"
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
#

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Flutter
export PATH="$PATH:$HOME/.flutter/bin"

# FZF
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git"

# Go
export GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"

# Homebrew
export HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -s 'Homebrew GitHub Token' -w)

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# lvim
export PATH="$PATH:$HOME/.local/bin"

# OpenAI
export OPENAI_API_KEY=$(security find-generic-password -s 'OpenAI API Key' -w)
# OpenRouter
export OPENROUTER_API_KEY=$(security find-generic-password -s 'OpenRouter API Key' -w)

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Stripe
fpath=(~/.stripe $fpath)
autoload -Uz compinit && compinit -i

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"

alias luamake=/Users/rnevius/.lua-ls/3rd/luamake/luamake

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/rnevius/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# bun completions
[ -s "/Users/rnevius/.bun/_bun" ] && source "/Users/rnevius/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
