vim.pack.add({ "https://www.github.com/echasnovski/mini.nvim" })

require("mini.ai").setup({})
require("mini.comment").setup({})
require("mini.move").setup({})
require("mini.surround").setup({})
require("mini.cursorword").setup({})
require("mini.pairs").setup({})
require("mini.trailspace").setup({})
require("mini.bufremove").setup({})
require("mini.icons").setup({})

-- start screen: nvim logo only (no menu/help text)
require("mini.starter").setup({
  header = table.concat({
    "          ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖",
    "          ▜███▙       ▜███▙  ▟███▛",
    "           ▜███▙       ▜███▙▟███▛ ",
    "            ▜███▙       ▜██████▛  ",
    "     ▟█████████████████▙ ▜████▛   ",
    "    ▟███████████████████▙ ▜███▙   ",
    "           ▄▄▄▄▖           ▜███▙  ",
    "          ▟███▛             ▜██▛  ",
    "         ▟███▛               ▜▛   ",
    "▟███████████▛                     ",
    "▝▀▀▀▀▀▀▀▀▀▀▀▘            N E O V I M",
  }, "\n"),
  -- one empty item + only the centering hook => centered logo, no menu text
  items = { { name = "", action = "", section = "" } },
  content_hooks = {
    require("mini.starter").gen_hook.aligning("center", "center"),
  },
  footer = "",
})

-- hide the cursor while the starter screen is shown, restore on leave
local starter_cursor = vim.api.nvim_create_augroup("MiniStarterCursor", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = starter_cursor,
  pattern = "MiniStarterOpened",
  callback = function()
    vim.g.saved_guicursor = vim.o.guicursor
    vim.api.nvim_set_hl(0, "MiniStarterCursor", { blend = 100, nocombine = true })
    vim.opt.guicursor = "a:MiniStarterCursor"
  end,
})
vim.api.nvim_create_autocmd("BufLeave", {
  group = starter_cursor,
  callback = function()
    if vim.bo.filetype == "ministarter" then
      vim.opt.guicursor = vim.g.saved_guicursor
    end
  end,
})

require("mini.diff").setup({
  view = {
    style = "sign",
    signs = { add = "▎", change = "▎", delete = "▎" },
  },
})

require("mini.git").setup({})

local MiniDiff = require("mini.diff")
vim.keymap.set("n", "]h", function()
  MiniDiff.goto_hunk("next")
end, { desc = "Next git hunk" })
vim.keymap.set("n", "[h", function()
  MiniDiff.goto_hunk("prev")
end, { desc = "Prev git hunk" })
vim.keymap.set("n", "<leader>hs", MiniDiff.operator, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hp", function()
  MiniDiff.toggle_overlay()
end, { desc = "Preview diff overlay" })
vim.keymap.set("n", "<leader>hb", function()
  require("mini.git").show_at_cursor()
end, { desc = "Git blame/show" })
