vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

require("mason").setup({})

-- auto-install the tools this config relies on (mason package names).
-- runs on startup; installs anything missing, no-ops once present.
require("mason-tool-installer").setup({
  ensure_installed = {
    "basedpyright",        -- python LSP
    "gopls",               -- go LSP
    "lua-language-server", -- lua LSP (lua_ls)
    "ruff",                -- python linter/formatter LSP
    "stylua",              -- lua formatter
  },
})
