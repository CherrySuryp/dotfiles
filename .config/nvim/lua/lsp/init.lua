-- ============================================================================
-- LSP, Linting, Formatting & Completion
-- ============================================================================
-- nvim-lspconfig ships the per-server default configs that vim.lsp.enable reads
vim.pack.add({ "https://www.github.com/neovim/nvim-lspconfig" })

local diagnostic_signs = {
  Error = "\u{f057} ",
  Warn = "\u{f071} ",
  Hint = "\u{ea61}",
  Info = "\u{f05a}",
}

vim.diagnostic.config({
  virtual_text = { prefix = "●", spacing = 4 },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
      [vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
      [vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
      [vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
    header = "",
    prefix = "",
    focusable = false,
    style = "minimal",
  },
})

do
  local orig = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    return orig(contents, syntax, opts, ...)
  end
end

local function lsp_on_attach(ev)
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if not client then
    return
  end

  local bufnr = ev.buf
  local opts = { noremap = true, silent = true, buffer = bufnr }

  local function o(desc)
    return vim.tbl_extend("force", opts, { desc = desc })
  end

  vim.keymap.set("n", "gd", function()
    require("fzf-lua").lsp_definitions({ jump1 = true })
  end, o("Go to definition"))

  vim.keymap.set("n", "grr", function()
    require("fzf-lua").lsp_references()
  end, o("Show references"))

  vim.keymap.set("n", "grn", vim.lsp.buf.rename, o("Rename symbol"))

  vim.keymap.set("n", "<leader>gS", function()
    vim.cmd("vsplit")
    vim.lsp.buf.definition()
  end, o("Go to definition in split"))

  vim.keymap.set("n", "<leader>ca", function()
    require("fzf-lua").lsp_code_actions()
  end, o("Code action"))

  vim.keymap.set("n", "<leader>la", function()
    require("fzf-lua").lsp_code_actions()
  end, o("LSP code actions"))
  vim.keymap.set("n", "<leader>lf", function()
    vim.lsp.buf.format({ async = true })
  end, o("Format buffer"))

  vim.keymap.set("n", "<leader>D", function()
    vim.diagnostic.open_float({ scope = "line" })
  end, o("Show line diagnostics"))
  vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.open_float({ scope = "cursor" })
  end, o("Show cursor diagnostics"))
  vim.keymap.set("n", "<leader>nd", function()
    vim.diagnostic.jump({ count = 1 })
  end, o("Next diagnostic"))
  vim.keymap.set("n", "<leader>pd", function()
    vim.diagnostic.jump({ count = -1 })
  end, o("Prev diagnostic"))

  vim.keymap.set("n", "K", vim.lsp.buf.hover, o("Hover documentation"))

  vim.keymap.set("n", "<leader>fr", function()
    require("fzf-lua").lsp_references()
  end, o("LSP references"))
  vim.keymap.set("n", "<leader>ft", function()
    require("fzf-lua").lsp_typedefs()
  end, o("LSP type definitions"))
  vim.keymap.set("n", "<leader>fs", function()
    require("fzf-lua").lsp_document_symbols()
  end, o("LSP document symbols"))
  vim.keymap.set("n", "<leader>fw", function()
    require("fzf-lua").lsp_workspace_symbols()
  end, o("LSP workspace symbols"))
  vim.keymap.set("n", "<leader>fi", function()
    require("fzf-lua").lsp_implementations()
  end, o("LSP implementations"))

  if client:supports_method("textDocument/codeAction", bufnr) then
    vim.keymap.set("n", "<leader>oi", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports" }, diagnostics = {} },
        apply = true,
        bufnr = bufnr,
      })
      vim.defer_fn(function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end, 50)
    end, o("Organize imports & format"))
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
  callback = lsp_on_attach,
})

vim.keymap.set("n", "<leader>q", function()
  vim.diagnostic.setloclist({ open = true })
end, { desc = "Open diagnostic list" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- shared capabilities (blink.cmp) for all servers
vim.lsp.config["*"] = {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
}

-- per-language server configs (files named by language, not by server)
require("lsp.lua")
require("lsp.python")
require("lsp.go")

vim.lsp.enable({
  "lua_ls",
  "basedpyright",
  "ruff",
  "gopls",
})
