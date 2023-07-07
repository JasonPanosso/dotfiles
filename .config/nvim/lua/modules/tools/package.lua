local package = require('core.pack').package
local conf = require('modules.tools.config')

package({
  'folke/neodev.nvim',
})

package({
  'glepnir/hlsearch.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = function()
    require('hlsearch').setup()
  end,
})

package({
  'norcalli/nvim-colorizer.lua',
  ft = { 'lua', 'css', 'html', 'sass', 'less', 'typescriptreact', 'conf', 'config' },
  event = { 'BufRead', 'BufNewFile' },
  config = function()
    require('colorizer').setup()
  end,
})

package({
  'theprimeagen/harpoon',
  config = function()
    require('harpoon').setup()
  end,
})

package({
  'mbbill/undotree',
  event = { 'BufRead', 'BufNewFile' },
})

package({
  'christoomey/vim-tmux-navigator',
})

package({
  'sindrets/diffview.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = conf.diffview,
})

package({
  'MunifTanjim/nui.nvim',
})

package({
  'kdheepak/lazygit.nvim',
})

package({
  'numToStr/Comment.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = conf.comment,
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
})
