vim.pack.add({ "https://www.github.com/nvim-tree/nvim-tree.lua" })

require("nvim-tree").setup({
  view = {
    width = 35,
  },
  filters = {
    dotfiles = false,
  },
  renderer = {
    group_empty = true,
  },
})
vim.keymap.set("n", "<leader>e", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree" })
