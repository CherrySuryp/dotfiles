-- ============================================================================
-- Centralized Keymap Overrides
-- ============================================================================
-- This file contains all custom keymap configurations for plugins and core
-- functionality. Keeping keymaps centralized here makes it easier to:
--   - Find and modify keybindings in one place
--   - Avoid conflicts between different plugin configurations
--   - Maintain consistency across the configuration
-- ============================================================================

return {
  -- ToggleTerm keymaps
  {
    "akinsho/toggleterm.nvim",
    opts = function(_, opts)
      -- Disable default open_mapping to prevent conflicts
      opts.open_mapping = nil
      return opts
    end,
    keys = {
      -- <C-`> (backtick/tilde key) to toggle terminal horizontally
      {
        "<C-`>",
        "<cmd>ToggleTerm direction=horizontal<cr>",
        desc = "Toggle horizontal terminal",
        mode = { "n", "t" },
      },
    },
  },

  -- Add more plugin keymap overrides here as needed
  -- Example:
  -- {
  --   "plugin-name",
  --   keys = {
  --     { "keymap", "command", desc = "description" },
  --   },
  -- },
}
