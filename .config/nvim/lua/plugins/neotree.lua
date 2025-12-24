return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem = opts.filesystem or {}
      opts.filesystem.filtered_items = opts.filesystem.filtered_items or {}

      -- Only show icon and name (disable size, type, last_modified columns)
      opts.filesystem.renderers = {
        directory = {
          { "icon" },
          { "current_filter" },
          { "name" },
        },
        file = {
          { "icon" },
          { "name" },
          { "git_status", highlight = "NeoTreeDimText" },
        },
      }

      -- Make hidden files (dotfiles) visible
      opts.filesystem.filtered_items.hide_dotfiles = false
      opts.filesystem.filtered_items.visible = true

      -- Disable auto-following the current file (useful in large monorepos)
      opts.filesystem.follow_current_file = { enabled = false }

      -- Disable the source selector tabs (File/Bufs/Git)
      opts.source_selector = opts.source_selector or {}
      opts.source_selector.winbar = false

      -- Add zz mapping to center the view
      opts.window = opts.window or {}
      opts.window.mappings = opts.window.mappings or {}
      opts.window.mappings["zz"] = function()
        vim.cmd("normal! zz")
      end

      return opts
    end,
  },
}
