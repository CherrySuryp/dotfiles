-- which-key.nvim: popup showing available keybindings
vim.pack.add({ "https://github.com/folke/which-key.nvim" })

require("which-key").setup({})

vim.opt.spell = false

vim.keymap.set("n", "<leader>us", function()
  vim.opt.spell = not vim.opt.spell:get()
end, { desc = "Toggle spellcheck" })

require("which-key").add({
  { "<leader>b", group = "Buffers" },
  { "<leader>d", group = "Diagnostics" },
  { "<leader>f", group = "Find" },
  { "<leader>g", group = "Go to" },
  { "<leader>h", group = "Git hunks" },
  { "<leader>l", group = "LSP" },
  { "<leader>o", group = "Organize" },
  { "<leader>p", group = "Path/File" },
  { "<leader>t", group = "Toggle" },
  { "<leader>u", group = "UI" },
  { "<leader>w", group = "Windows" },
})
