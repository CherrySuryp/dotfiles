# Dotfiles

Personal configuration files managed with GNU Stow.

## What's Included

- **zsh** - Shell configuration
- **nvim** - Neovim editor settings
- **tmux** - Terminal multiplexer configuration
- **iterm2** - iTerm2 profile exports
- **ghostty** - Ghostty terminal configuration

## Gitignore Rules

The repository uses selective tracking for the `.config` directory:

- **Neovim** - All files tracked
- **iTerm2** - Only `*.itermexport` profile files tracked
- **Tmux** - All files tracked except the `plugins/` directory
- **Claude** - Only the `commands/` directory tracked

See `.gitignore` for the complete pattern structure and instructions on adding new exceptions.

## Initial Setup with Existing Dotfiles

If you already have dotfiles in your home directory before using Stow:

1. **Backup and move existing dotfiles** to this repository:
   ```bash
   # Example: move existing config files
   mv ~/.config/nvim ~/.dotfiles/.config/
   mv ~/.zshrc ~/.dotfiles/
   ```

2. **Install GNU Stow** (if not already installed):
   ```bash
   # macOS
   brew install stow

   # Ubuntu/Debian
   sudo apt install stow
   ```

3. **Create symlinks** using Stow:
   ```bash
   cd ~/.dotfiles
   stow .
   ```

**Note:** Stow will fail if files already exist at the target location. You must move or remove existing files before running `stow`.

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
