-- everforest colorscheme (default)
vim.pack.add({ "https://github.com/neanias/everforest-nvim" })

require("everforest").setup({
  background = "hard", -- contrast: "hard" | "medium" | "soft"
  -- floats (yazi.nvim, etc.) default to lighter float backgrounds; pin every
  -- float bg to the editor bg so they blend seamlessly
  on_highlights = function(hl, palette)
    local bg = palette.bg0 -- editor Normal background
    hl.NormalFloat = { link = "Normal" }
    hl.FloatBorder = { fg = palette.grey1, bg = bg }
    hl.FloatTitle = { fg = palette.grey1, bg = bg }
  end,
})

vim.cmd.colorscheme("everforest")
