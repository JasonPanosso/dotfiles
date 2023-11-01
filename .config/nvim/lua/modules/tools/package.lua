local package = require('core.pack').package
local conf = require('modules.tools.config')

package({
  'folke/neodev.nvim',
  lazy = false,
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
  lazy = false,
  config = conf.harpoon,
})

package({
  'mbbill/undotree',
  event = { 'BufRead', 'BufNewFile' },
})

package({
  'christoomey/vim-tmux-navigator',
  lazy = false,
})

package({
  'sindrets/diffview.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = conf.diffview,
})

package({
  'MunifTanjim/nui.nvim',
  lazy = false,
})

package({
  'kdheepak/lazygit.nvim',
  lazy = false,
})

package({
  'folke/trouble.nvim',
  event = { 'BufRead', 'BufNewFile' },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
})

package({
  'rest-nvim/rest.nvim',
  event = { 'BufRead', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = conf.rest,
})

package({ 'ellisonleao/glow.nvim', config = true, cmd = 'Glow' })
