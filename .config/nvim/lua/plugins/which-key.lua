-- which-key.nvim: popup showing available keybindings
vim.pack.add({ "https://github.com/folke/which-key.nvim" })

require("which-key").setup({})

require("which-key").add({
  { "<leader>b", group = "Buffers" },
  { "<leader>d", group = "Diagnostics" },
  { "<leader>f", group = "Find" },
  { "<leader>g", group = "Go to" },
  { "<leader>h", group = "Git hunks" },
  { "<leader>l", group = "LSP" },
  { "<leader>o", group = "Organize" },
  { "<leader>p", group = "Path/File" },
  { "<leader>t", group = "Terminal/Toggle" },
  { "<leader>w", group = "Windows" },
})
