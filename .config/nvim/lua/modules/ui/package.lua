local package = require('core.pack').package
local conf = require('modules.ui.config')

package({ 'rebelot/kanagawa.nvim', lazy = false, config = conf.kanagawa })

package({ 'goolord/alpha-nvim', lazy = false, config = conf.alpha })

package({
  'nvim-lualine/lualine.nvim',
  config = conf.lualine,
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
})

package({
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = conf.indent_blankline,
})

package({
  'lewis6991/gitsigns.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = conf.gitsigns,
})

package({
  'stevearc/oil.nvim',
  lazy = false,
  config = conf.oil,
})
