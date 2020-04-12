# dotfiles

Personal dotfiles and configuration instructions to hedge against the fallout from a MacBook explosion.

## Configuring Neovim

1. Install [neovim](https://neovim.io/), [fd](https://github.com/sharkdp/fd), [fzf](https://github.com/junegunn/fzf), and [ripgrep](https://github.com/BurntSushi/ripgrep) with Homebrew:
    ```
    brew install neovim fd fzf ripgrep
    ```
1. Install [universal-ctags](https://github.com/universal-ctags/ctags):
    ```
    brew install --HEAD universal-ctags/universal-ctags/universal-ctags
    ```
1. Set the default FZF command in .zshrc, so that fzf-vim has a more useful `:Files` output:
    ```
    export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
    ```
1. Make sure that Python 3 is installed and add the `neovim` package:
    ```
    python3 -m pip install --user --upgrade pynvim
    ```
1. Install [vim-plug](https://github.com/junegunn/vim-plug):
    ```
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
1. Create an `undo/` directory in the default location, for persistent undo:
    ```
    mkdir -p ~/.local/share/nvim/undo
    ```
1. Clone the `init.vim` file from this repo:
    ```
    curl -fLo ~/.config/nvim/init.vim --create-dirs \
    https://raw.githubusercontent.com/rnevius/neovim.conf/master/init.vim
    ```
1. Start `nvim` and install plugins: `nvim -c PlugInstall`

Optional, project-specific settings can be added to `~/.config/nvim/projects.nvim`. For example:

```vim
augroup ProjectSettings
  autocmd!
augroup END

function! SomeProject() abort
  set makeprg=docker-compose\ exec\ -T\ web\ bundle\ exec\ rake\ spec
endfunction
autocmd ProjectSettings BufNewFile,BufRead ~/www/some-project/**/*
  \ call SomeProject()
```
