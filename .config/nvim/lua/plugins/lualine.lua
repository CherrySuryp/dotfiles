-- lualine.nvim: statusline (evil_lualine example config)
vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons", -- icon provider
  "https://github.com/nvim-lualine/lualine.nvim",
})

-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require("lualine")

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Read a highlight group's fg/bg with a fallback, so component colors track
-- whatever colorscheme is active instead of a hardcoded palette.
local function hl(group, attr, fallback)
  local ok, def = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
  if ok and def[attr] then
    return string.format("#%06x", def[attr])
  end
  return fallback
end

-- Derive the component palette from the current colorscheme's highlight groups.
local function make_colors()
  return {
    bg       = hl("Normal", "bg", "#0b0e14"), -- match the editor background exactly
    fg       = hl("Normal", "fg", "#bfbdb6"),
    yellow   = hl("DiagnosticWarn", "fg", "#e6b450"),
    cyan     = hl("Special", "fg", "#95e6cb"),
    darkblue = hl("Function", "fg", "#59c2ff"),
    green    = hl("String", "fg", "#aad94c"),
    orange   = hl("Constant", "fg", "#ff8f40"),
    violet   = hl("Statement", "fg", "#d2a6ff"),
    magenta  = hl("Identifier", "fg", "#d2a6ff"),
    blue     = hl("Function", "fg", "#59c2ff"),
    red      = hl("DiagnosticError", "fg", "#f07178"),
  }
end

-- Build the full lualine config from a freshly-derived palette.
local function build_config()
  local colors = make_colors()

  local config = {
    options = {
      component_separators = "",
      section_separators = "",
      globalstatus = true,
      theme = {
        normal = { c = { fg = colors.fg, bg = colors.bg } },
        inactive = { c = { fg = colors.fg, bg = colors.bg } },
      },
    },
    sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
  }

  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
  end

  ins_left({
    function()
      return "▊"
    end,
    color = { fg = colors.blue },
    padding = { left = 0, right = 1 },
  })

  ins_left({
    -- mode component
    function()
      return ""
    end,
    color = function()
      local mode_color = {
        n = colors.red,
        i = colors.green,
        v = colors.blue,
        [""] = colors.blue,
        V = colors.blue,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange,
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.red,
        t = colors.red,
      }
      return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 },
  })

  ins_left({
    "filesize",
    cond = conditions.buffer_not_empty,
  })

  ins_left({
    "filename",
    cond = conditions.buffer_not_empty,
    color = { fg = colors.magenta, gui = "bold" },
  })

  ins_left({ "location" })

  ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

  ins_left({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " " },
    diagnostics_color = {
      error = { fg = colors.red },
      warn = { fg = colors.yellow },
      info = { fg = colors.cyan },
    },
  })

  -- mid section spacer
  ins_left({
    function()
      return "%="
    end,
  })

  ins_left({
    -- Lsp server name
    function()
      local msg = "No Active Lsp"
      local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
      local clients = vim.lsp.get_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end,
    icon = " LSP:",
    color = { fg = colors.fg, gui = "bold" },
  })

  ins_right({
    "o:encoding",
    fmt = string.upper,
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = "bold" },
  })

  ins_right({
    "fileformat",
    fmt = string.upper,
    icons_enabled = false,
    color = { fg = colors.green, gui = "bold" },
  })

  ins_right({
    "branch",
    icon = "",
    color = { fg = colors.violet, gui = "bold" },
  })

  ins_right({
    "diff",
    symbols = { added = " ", modified = "󰝤 ", removed = " " },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.orange },
      removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
  })

  ins_right({
    function()
      return "▊"
    end,
    color = { fg = colors.blue },
    padding = { left = 1 },
  })

  return config
end

local function setup_lualine()
  lualine.setup(build_config())
end

setup_lualine()

-- Re-derive colors and rebuild the bar whenever the colorscheme changes.
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("LualineFollowColorscheme", { clear = true }),
  callback = setup_lualine,
})
