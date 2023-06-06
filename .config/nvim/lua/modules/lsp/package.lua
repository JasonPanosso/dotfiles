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
  },
  config = conf.nvim_lsp,
  dependencies = {
    'jose-elias-alvarez/null-ls.nvim',
    'glepnir/lspsaga.nvim',
    'j-hui/fidget.nvim',
    'leafoftree/vim-svelte-plugin',
    'windwp/nvim-ts-autotag',
  },
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
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'jose-elias-alvarez/typescript.nvim' },
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

package({ 'L3MON4D3/LuaSnip', event = 'InsertCharPre', config = conf.lua_snip })

package({
  'jose-elias-alvarez/typescript.nvim',
  config = conf.typescript,
  dependencies = {
    { 'jose-elias-alvarez/null-ls.nvim' },
    { 'neovim/nvim-lspconfig' },
  },
})

package({
  'simrat39/rust-tools.nvim',
  config = conf.rust_tools,
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-lua/plenary.nvim' },
})
