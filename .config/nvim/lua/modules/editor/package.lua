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
    'JoosepAlviste/nvim-ts-context-commentstring',
    'lopi-py/luau-lsp.nvim',
  },
})

package({
  'tpope/vim-sleuth',
  event = { 'BufRead', 'BufNewFile' },
})

package({
  'numToStr/Comment.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = function()
    require('Comment').setup()
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'JoosepAlviste/nvim-ts-context-commentstring',
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
    'ahmedkhalf/project.nvim',
  },
})

package({
  'mhartington/formatter.nvim',
  config = conf.formatter,
  event = 'BufRead',
})
