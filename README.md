# dotfiles

Personal dotfiles and configuration instructions to hedge against the fallout from a laptop explosion 💥.

## General Instructions

1. Install most commonly used packages:

    ```bash
    brew install fd fzf git lazygit lazydocker node neovim ripgrep stow eza
    ```

1. Generate symlinks with stow:

    ```bash
    stow git kitty nvim tmux fish share
    ```
