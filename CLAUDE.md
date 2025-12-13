# Dotfiles Repository Guide

Personal configuration files managed with GNU Stow. See README.md for installation instructions.

## Components

- **Zsh** - Shell configuration (`.zshrc`)
- **Neovim** - Editor settings (`.config/nvim/`)
- **Tmux** - Terminal multiplexer (`.config/tmux/`)
- **iTerm2** - Profile exports (`.config/iterm2/`)
- **Claude** - Custom commands (`.claude/commands/`)

## File Organization

### .gitignore Policy

**Default-ignore**: Everything is ignored by default. Files must be explicitly included via negation patterns.

Pattern structure for including files in ignored directories:
```gitignore
# 1. Un-ignore the parent directory
!path/to/dir/
# 2. Ignore everything inside it
path/to/dir/*
# 3. Un-ignore specific files
!path/to/dir/*.extension
```

**Current tracking rules:** Check `.gitignore` for the authoritative list of tracked files and directories. Run `git ls-files` to quickly see all currently tracked files.

### .stow-local-ignore Policy

Files in `.stow-local-ignore` are tracked by git but NOT symlinked by stow. Use this for repo-specific files that shouldn't appear in the home directory.

**Currently excluded from stowing:**
- `README.md` - Repository documentation
- `CLAUDE.md` - This file
- `Makefile` - Installation automation
- `lefthook.yml` - Git hooks configuration
- `.git`, `.github`, `.gitignore` - Git internals

When adding new repo-level files, add them to `.stow-local-ignore`.

## Style Guides

### Zsh (.zshrc)

**Structure:**
1. Powerlevel10k instant prompt (top of file)
2. Exports
3. Theme configuration
4. Plugins list
5. Source oh-my-zsh
6. Extra configs sourced from `~/.config/zsh/*.zsh`

**Plugins order:**
```zsh
plugins=(
  git
  docker
  terraform
  zsh-autosuggestions
  zsh-syntax-highlighting
)
```

### Neovim (.config/nvim/)

**Framework:** AstroNvim v5 (https://docs.astronvim.com)

**Plugin file organization:**
- One plugin per file in `lua/plugins/`
- Use descriptive filenames matching plugin purpose
- Template files use guard: `if true then return {} end`

**Lazy.nvim spec format:**
```lua
return {
  "author/plugin-name",
  opts = {
    -- configuration
  },
}
```

**Key files:**
- `lua/plugins/astrolsp.lua` - LSP configuration
- `lua/plugins/keymaps.lua` - Centralized keymap overrides
- `lua/plugins/mason.lua` - Tool installation (LSPs, formatters)

**StyLua formatting (`.stylua.toml`):**
- 2-space indent
- 120 column width
- Unix line endings
- Double quotes preferred

### Tmux (.config/tmux/)

See `.config/tmux/CLAUDE.md` for detailed style guide.

**Summary:**
- Major sections: 76 `=` characters
- Subsections: `# --- Name ---`
- Section order: General, Prefix, Key Bindings, Copy Mode, Plugins

## Git Hooks

**Lefthook configuration (`lefthook.yml`):**

Pre-commit hooks:
- `gitleaks` - Scans staged changes for secrets
