-- ayu colorscheme (installed, not default; activate with :colorscheme ayu-dark)
vim.pack.add({ "https://github.com/Shatur/neovim-ayu" })

require("ayu").setup({
  mirage = false,
  terminal = true,
})
