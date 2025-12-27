# dotfiles

## General Instructions

Generate symlinks with stow:

```bash
❯ stow bat fastfetch fish ghostty git nvim paru share
```

Add environment variables to `~/.config/fish/conf.d/env.fish`.

## Brew

Installed brew packages are occasionally exported to [brew-packages.txt](./brew-packages.txt) with `brew leaves`. Install them with `xargs`:

```bash
❯ xargs brew install < brew-packages.txt
```

## Paru

Installed pacman packages are occasionally exported to [paru-packages.txt](./paru-packages.txt) with:

```bash
❯ pacman -Qe | awk '{ print $1 }' > paru-packages.txt
```

Install them with `paru`:

```bash
❯ paru -S --needed - < paru-packages.txt
```

## GNOME Shell Extensions

This could be automatically updated on a schedule, but for now:

```bash
❯ dconf dump /org/gnome/shell/extensions/ > gnome-shell-extension-settings.dconf
```

To restore:

```bash
❯ dconf load /org/gnome/shell/extensions/ < gnome-shell-extension-settings.dconf
```
