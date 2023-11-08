local package = require('core.pack').package
local conf = require('modules.lsp.config')

package({
  'neovim/nvim-lspconfig',
  -- used filetype to lazyload lsp
  -- config your language filetype in here
  ft = {
    'lua',
    'html',
    'css',
    'typescript',
    'typescriptreact',
    'javascript',
    'javascriptreact',
    'sh',
    'json',
    'python',
    'svelte',
    'markdown',
    'rust',
    'sql',
    'prisma',
  },
  config = conf.nvim_lsp,
  dependencies = {
    'jose-elias-alvarez/null-ls.nvim',
    'glepnir/lspsaga.nvim',
  },
})

package({
  'j-hui/fidget.nvim',
  tag = 'legacy',
  event = { 'BufRead', 'BufNewFile' },
  config = function()
    require('fidget').setup()
  end,
})

package({
  'williamboman/mason.nvim',
  build = ':MasonUpdate',
  config = conf.mason,
  dependencies = {
    { 'williamboman/mason-lspconfig.nvim' },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
  },
})

package({
  'jose-elias-alvarez/null-ls.nvim',
  config = conf.null_ls,
  event = { 'BufRead', 'BufNewFile' },
  dependencies = {
    { 'neovim/nvim-lspconfig' },
  },
})

package({
  'glepnir/lspsaga.nvim',
  event = 'LspAttach',
  config = conf.lspsaga,
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-treesitter/nvim-treesitter' },
  },
})

package({
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = conf.nvim_cmp,
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'onsails/lspkind.nvim' },
    { 'windwp/nvim-autopairs' },
  },
})

package({
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = conf.auto_pairs,
})

package({
  'pmizio/typescript-tools.nvim',
  config = conf.typescript_tools,
  ft = {
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'javascript',
    'javascriptreact',
  },
})

package({
  'simrat39/rust-tools.nvim',
  config = conf.rust_tools,
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-lua/plenary.nvim' },
  ft = 'rust',
})

package({
  'aznhe21/actions-preview.nvim',
  event = 'LspAttach',
  config = conf.actions_preview,
})
