-- render-markdown.nvim: rich markdown rendering in the buffer
vim.pack.add({ "https://github.com/meanderingprogrammer/render-markdown.nvim" })

require("render-markdown").setup({
  enabled = true,
})

vim.keymap.set("n", "<leader>um", function()
  require("render-markdown").toggle()
end, { desc = "Toggle render markdown" })
