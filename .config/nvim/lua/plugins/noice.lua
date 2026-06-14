-- noice.nvim: replaces the cmdline / messages / popupmenu UI
vim.pack.add({
  "https://github.com/MunifTanjim/nui.nvim", -- required dependency
  "https://github.com/rcarriga/nvim-notify", -- notification backend
  "https://github.com/folke/noice.nvim",
})

require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
    progress = {
      enabled = false, -- no per-keystroke LSP progress toasts (basedpyright spam)
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
  views = {
    -- center the cmdline popup (command_palette preset otherwise pins it to the top)
    cmdline_popup = {
      position = { row = "35%", col = "50%" },
    },
    cmdline_popupmenu = {
      position = { row = "50%", col = "50%" },
    },
  },
})
