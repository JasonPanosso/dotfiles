local package = require('core.pack').package
local conf = require('modules.lsp.config')

package({
  'neovim/nvim-lspconfig',
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
    'sql',
    'go',
    'rust',
  },
  config = conf.nvim_lsp,
  dependencies = {
    'folke/neodev.nvim',
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
  config = conf.mason,
  dependencies = {
    { 'williamboman/mason-lspconfig.nvim' },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    { 'lopi-py/luau-lsp.nvim' },
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
  'onsails/lspkind.nvim',
  commit = '57610d5',
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
    'svelte',
  },
})

-- package({
--   'simrat39/rust-tools.nvim',
--   config = conf.rust_tools,
--   dependencies = { 'mfussenegger/nvim-dap', 'nvim-lua/plenary.nvim' },
--   ft = 'rust',
-- })

package({
  'mrcjkb/rustaceanvim',
  config = conf.rustaceanvim,
  version = '^3',
  ft = 'rust',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- 'mfussenegger/nvim-dap',
    'lvimuser/lsp-inlayhints.nvim',
  },
})

package({
  'lvimuser/lsp-inlayhints.nvim',
  config = conf.inlayhints,
  event = 'LspAttach',
})

package({
  'aznhe21/actions-preview.nvim',
  event = 'LspAttach',
  config = conf.actions_preview,
})

package({
  'mfussenegger/nvim-lint',
  event = { 'BufRead', 'BufNewFile' },
  config = conf.lint,
  dependencies = { 'williamboman/mason.nvim' },
})

package({
  'jmederosalvarado/roslyn.nvim',
  ft = 'cs',
  config = conf.roslyn_lsp,
  dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
})
