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
  },
  config = conf.nvim_lsp,
  dependencies = {
    'jose-elias-alvarez/null-ls.nvim',
    'glepnir/lspsaga.nvim',
    'windwp/nvim-ts-autotag',
    'leafoftree/vim-svelte-plugin',
    'glepnir/lspsaga.nvim',
    'windwp/nvim-autopairs',
    'j-hui/fidget.nvim',
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
  },
})

package({
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = conf.auto_pairs,
})

package({ 'L3MON4D3/LuaSnip', event = 'InsertCharPre', config = conf.lua_snip })
