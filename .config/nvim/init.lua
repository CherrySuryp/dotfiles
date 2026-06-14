-- Entry point. Load order matters:
--   core.* sets options/keymaps/ui before anything else
--   every plugins/*.lua declares its own vim.pack.add + config (incl. blink.cmp)
--   lsp pulls blink capabilities, so it must run after the plugin files
require("core.ui")
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- load colorschemes first (lualine reads the ayu palette at load time)
local colorscheme_dir = vim.fn.stdpath("config") .. "/lua/colorscheme"
for _, path in ipairs(vim.fn.globpath(colorscheme_dir, "*.lua", false, true)) do
  require("colorscheme." .. vim.fn.fnamemodify(path, ":t:r"))
end

-- load every plugin module (each is self-contained: pack.add + setup)
local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
for _, path in ipairs(vim.fn.globpath(plugin_dir, "*.lua", false, true)) do
  require("plugins." .. vim.fn.fnamemodify(path, ":t:r"))
end

require("lsp")
