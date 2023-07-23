local package = require('core.pack').package
local conf = require('modules.editor.config')

package({
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufRead', 'BufNewFile' },
  run = ':TSUpdate',
  config = conf.nvim_treesitter,
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'windwp/nvim-ts-autotag',
    'tpope/vim-sleuth',
  },
})

package({
  'L3MON4D3/LuaSnip',
  event = 'InsertCharPre',
  config = conf.lua_snip,
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
})

package({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzy-native.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'xiyaowong/telescope-emoji.nvim',
    'ahmedkhalf/project.nvim',
  },
})
