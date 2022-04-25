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
plugins=(git poetry zsh-nvm z)
source $ZSH/oh-my-zsh.sh

# kitty completion
kitty + complete setup zsh | source /dev/stdin

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
alias asciinema="TERM=xterm-256color asciinema"
alias k="kitty --session=Session.kitty"
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
# direnv
eval "$(direnv hook zsh)"

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

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/Users/rnevius/Library/Python/3.9/bin:$PATH"

# Ruby
eval "$(rbenv init -)"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Stripe
fpath=(~/.stripe $fpath)
autoload -Uz compinit && compinit -i

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"

alias luamake=/Users/rnevius/.lua-ls/3rd/luamake/luamake

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/rnevius/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
