-- bufferline.nvim: buffers as tabs in the top bar
vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons", -- icon provider
  "https://github.com/akinsho/bufferline.nvim",
})

require("bufferline").setup({
  options = {
    separator_style = "slant", -- slanted/triangular tab edges
  },
})

vim.keymap.set("n", "<leader>bc", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close other buffers" })
vim.keymap.set("n", "<leader>bC", function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
      require("mini.bufremove").delete(buf, false)
    end
  end
  require("mini.starter").open()
end, { desc = "Close all buffers" })
vim.keymap.set("n", "<leader>r", "<cmd>BufferLineCloseRight<cr>", { desc = "Close buffers to the right" })
vim.keymap.set("n", "<leader>l", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close buffers to the left" })
vim.keymap.set("n", "<leader>s", "<cmd>BufferLineSortByRelativeDirectory<cr>", { desc = "Sort buffers" })
