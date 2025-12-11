# Dotfiles

Personal configuration files managed with GNU Stow.

## What's Included

- **zsh** - Shell configuration
- **nvim** - Neovim editor settings

## Usage with GNU Stow

Install dotfiles:
```bash
cd ~/.dotfiles
stow .
```

Remove dotfiles:
```bash
cd ~/.dotfiles
stow -D .
```

Restow (useful after updates):
```bash
cd ~/.dotfiles
stow -R .
```

This creates symlinks from your home directory to the files in this repository.
