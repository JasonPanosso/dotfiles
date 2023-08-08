local lspconfig = require('lspconfig')

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local signs = {
  Error = ' ',
  Warn = ' ',
  Info = ' ',
  Hint = ' ',
}
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  virtual_text = {
    prefix = '🔥',
    source = true,
  },
})

lspconfig.svelte.setup({
  capabilities = capabilities,
})
vim.g.vim_svelte_plugin_use_typescript = 1

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      format = {
        enable = false,
      },
      diagnostics = {
        enable = true,
        globals = { 'vim' },
      },
      runtime = { version = 'LuaJIT' },
      workspace = {
        library = (function()
          local lib = {}
          for _, path in ipairs(vim.api.nvim_get_runtime_file('lua', true)) do
            lib[#lib + 1] = path:sub(1, -5)
          end
          return lib
        end)(),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

lspconfig.pyright.setup({
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = 'on',
      },
    },
  },
})

lspconfig.jsonls.setup({
  capabilities = capabilities,
  on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})

lspconfig.marksman.setup({
  capabilities = capabilities,
})

lspconfig.cssls.setup({
  capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
  capabilities = capabilities,
  filetypes = { 'svelte' },
})

lspconfig.prismals.setup({
  capabilities = capabilities,
})

-- lspconfig.sqlls.setup({
--   capabilities = capabilities,
-- })

vim.lsp.handlers['workspace/diagnostic/refresh'] = function(_, _, ctx)
  local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
  local bufnr = vim.api.nvim_get_current_buf()
  vim.diagnostic.reset(ns, bufnr)
  return true
end
