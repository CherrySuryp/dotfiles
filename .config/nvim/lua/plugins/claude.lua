vim.pack.add({
	"https://github.com/coder/claudecode.nvim",
	"https://github.com/folke/snacks.nvim",
})

require("claudecode").setup({
	terminal = {
		-- snacks terminal defaults to NormalFloat (lighter); link it to Normal so the claude window background matches the editor exactly
		snacks_win_opts = {
			wo = {
				winhighlight = "Normal:Normal,NormalNC:Normal,NormalFloat:Normal",
			},
		},
	},
	diff_opts = {
		open_in_new_tab = true,
	},
})

-- which-key group label
vim.keymap.set("n", "<leader>a", "<nop>", { desc = "AI/Claude Code" })

local map = vim.keymap.set
map("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
map("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })
map("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude" })
map("n", "<leader>aC", "<cmd>ClaudeCode --continue<cr>", { desc = "Continue Claude" })
map("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Select Claude model" })
map("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer" })
map("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send selection to Claude" })
map("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept diff" })
map("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny diff" })

-- in file-tree buffers, <leader>as adds the file under the cursor
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("ClaudeCodeTreeAdd", { clear = true }),
	pattern = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
	callback = function(ev)
		vim.keymap.set(
			"n",
			"<leader>as",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			{ buffer = ev.buf, desc = "Add file to Claude" }
		)
	end,
})
