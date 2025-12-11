return {
  "Shatur/neovim-ayu",
  lazy = false,
  priority = 1000,
  config = function()
    require("ayu").setup {
      mirage = true,
      terminal = true,
      overrides = {
        TabLine = { bg = "None" },
        TabLineFill = { bg = "None" },
        TabLineSel = { bg = "None" },
        BufferLine = { bg = "None" },
        BufferLineFill = { bg = "None" },
        NeoTreeTabInactive = { bg = "None" },
        NeoTreeTabActive = { bg = "None" },
        NeoTreeTabSeparatorInactive = { bg = "None" },
        NeoTreeTabSeparatorActive = { bg = "None" },
      },
    }
  end,
}
