# Neovim Config

Vendor-free Neovim config using the built-in `vim.pack` API (Neovim 0.12+). No plugin manager.

## Structure

```
nvim/
├── init.lua              # Entry point — loads core → colorschemes → plugins → lsp
└── lua/
    ├── core/             # options, keymaps, autocmds, UI, terminal
    ├── colorscheme/      # ayu, everforest
    ├── plugins/          # one file per plugin, self-contained (pack.add + setup)
    └── lsp/              # per-language server configs (go, python, lua)
```

## Plugins

| Plugin | Purpose |
|---|---|
| [blink.cmp](https://github.com/saghen/blink.cmp) | Completion |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | Fuzzy finder (files, grep, LSP) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax / highlighting |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server defaults |
| [mason.nvim](https://github.com/mason-org/mason.nvim) + [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | Tool auto-install |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer tabs |
| [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |
| [mini.nvim](https://github.com/echasnovski/mini.nvim) | Various mini modules |
| [noice.nvim](https://github.com/folke/noice.nvim) | UI for messages / cmdline |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hints |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | Lazygit integration |
| [yazi.nvim](https://github.com/mikavilpas/yazi.nvim) | Yazi file manager |
| [claudecode.nvim](https://github.com/coder/claudecode.nvim) | Claude Code integration |

## LSP

Managed via `vim.lsp.enable` (Neovim 0.11 native). Mason auto-installs the servers on startup.

| Language | Server |
|---|---|
| Go | `gopls` |
| Python | `basedpyright`, `ruff` |
| Lua | `lua_ls` |

## Key Mappings

`<leader>` is `<Space>`.

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `gd` | Go to definition |
| `grr` | Show references |
| `grn` | Rename symbol |
| `K` | Hover docs |
| `<leader>ca` | Code actions |
| `<leader>lf` | Format buffer |
| `<leader>D` | Line diagnostics |
