-- yazi.nvim: yazi terminal file manager integration
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim", -- required dependency
  "https://github.com/mikavilpas/yazi.nvim",
})

require("yazi").setup({})

vim.keymap.set("n", "<leader>fy", "<cmd>Yazi<cr>", { desc = "Open yazi (file manager)" })
