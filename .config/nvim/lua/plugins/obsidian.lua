return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ft = "markdown",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = "engineering",
        path = "~/Obsidian/Engineering Vault",
      },
    },
  },

  note = {
    template = vim.NIL,
  },
}
