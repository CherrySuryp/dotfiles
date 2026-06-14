return {
  "petertriho/nvim-scrollbar",
  event = "BufReadPost",
  dependencies = { "lewis6991/gitsigns.nvim" },
  opts = {
    handlers = {
      gitsigns = true,
    },
  },
  config = function(_, opts)
    require("scrollbar").setup(opts)
    require("scrollbar.handlers.gitsigns").setup()
  end,
}