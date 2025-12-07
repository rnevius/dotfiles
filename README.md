# dotfiles

## General Instructions

Generate symlinks with stow:

```bash
stow bat fastfetch fish git kitty nvim paru share
```

Add environment variables to `~/.config/fish/conf.d/env.fish`

## Brew

Installed brew packages are occasionally exported to [brew_packages.txt](./brew_packages.txt) with `brew leaves`. Install them with `xargs`:

```bash
xargs brew install < brew_packages.txt
```

## Paru

Installed pacman packages are occasionally exported to [paru_packages.txt](./paru_packages.txt) with `pacman -Qe`. Install them with `paru`:

```bash
paru -S --needed - < paru_packages.txt
```
