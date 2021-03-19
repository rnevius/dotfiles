# dotfiles

Personal dotfiles and configuration instructions to hedge against the fallout from a MacBook explosion.

## Configuring Neovim

1. Install [stow](https://www.gnu.org/software/stow/), [fd](https://github.com/sharkdp/fd), [fzf](https://github.com/junegunn/fzf), and [ripgrep](https://github.com/BurntSushi/ripgrep) with Homebrew:
    ```
    brew install fd fzf ripgrep stow
    ```
1. Install [universal-ctags](https://github.com/universal-ctags/ctags) and [neovim](https://neovim.io/):
    ```
    brew install --HEAD universal-ctags/universal-ctags/universal-ctags neovim
    ```
1. Create an `undo/` directory in the default location, for persistent undo:
    ```
    mkdir -p ~/.local/share/nvim/undo
    ```
1. Generate symlinks with stow:
    ```
    stow git kitty nvim tmux zsh
    ```
1. Install language servers:
    ```
    ./lsp-install.zsh
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
