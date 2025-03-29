# dotfiles

Personal dotfiles and configuration instructions to hedge against the fallout from a laptop explosion 💥.

## General Instructions

1. Install most commonly used packages:

    ```bash
    brew install asdf fd fzf git lazygit node neovim ripgrep stow tree
    ```

1. Generate symlinks with stow:

    ```bash
    stow git kitty nvim tmux zsh
    ```
