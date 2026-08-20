-- basedpyright: type-checking, hover, completion
vim.lsp.config("basedpyright", {})

-- ruff: linting + code actions (Fix all, Organize imports) + formatting.
-- Run as its own LSP server (not just an efm linter) so its code actions surface.
vim.lsp.config("ruff", {
  on_attach = function(client, _bufnr)
    -- let basedpyright own hover; ruff only does lint/format/actions
    client.server_capabilities.hoverProvider = false
  end,
})
