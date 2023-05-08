local package = require('core.pack').package
local conf = require('modules.ui.config')

package({ 'rebelot/kanagawa.nvim', config = conf.kanagawa })

package({ 'goolord/alpha-nvim', config = conf.alpha })

package({
  'nvim-lualine/lualine.nvim',
  config = conf.lualine,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
})

package({
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufRead',
  config = conf.indent_blankline,
})

package({
  'lewis6991/gitsigns.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = conf.gitsigns,
})

package({
  'stevearc/oil.nvim',
  config = conf.oil,
})
