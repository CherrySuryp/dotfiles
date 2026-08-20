-- lazygit.nvim: lazygit integration (no setup(); configured via vim.g + commands)
vim.pack.add({
	"https://github.com/kdheepak/lazygit.nvim",
	"https://github.com/nvim-lua/plenary.nvim", -- required dependency
})

-- float the lazygit window, matching the editor background
vim.g.lazygit_floating_window_winblend = 0
vim.g.lazygit_floating_window_scaling_factor = 0.9
vim.g.lazygit_use_neovim_remote = 0

vim.keymap.set("n", "<leader>tl", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
