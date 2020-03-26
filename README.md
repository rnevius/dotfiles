# neovim.conf

Personal neovim installation and configuration instructions to hedge against the fallout from a Macbook explosion.

## Installing

1. Install `tsserver` for [ALE](https://github.com/dense-analysis/ale) definition jumping support:
    ```
    npm i -g typescript
    ```
1. Install [fzf](https://github.com/junegunn/fzf) and set the default command in .zshrc, so that fzf-vim has a more useful `:Files` output:
    ```
    export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
    ```
1. Install `neovim` and [ripgrep](https://github.com/BurntSushi/ripgrep) with Homebrew:
    ```
    brew install neovim ripgrep
    ```
1. Make sure that Python 3 is installed and add the `neovim` package for both 2/3:
    ```
    pip2 install --user neovim && pip3 install --user neovim
    ```
1. Install [vim-plug](https://github.com/junegunn/vim-plug):
    ```
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
1. Install [universal-ctags](https://github.com/universal-ctags/ctags)
1. Clone the `init.vim` file from this repo:
    ```
    curl -fLo ~/.config/nvim/init.vim --create-dirs \
    https://raw.githubusercontent.com/rnevius/neovim.conf/master/init.vim
    ```
1. Create an `undo/` directory in the default location, for persistent undo:
    ```
    mkdir -p ~/.local/share/nvim/undo
    ```
1. Start `nvim` and install plugins: `nvim -c PlugInstall`

