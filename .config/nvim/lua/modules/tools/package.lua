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
  'MunifTanjim/nui.nvim',
  lazy = false,
})

package({
  'kdheepak/lazygit.nvim',
  lazy = false,
})

package({
  'rest-nvim/rest.nvim',
  event = { 'BufRead', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = conf.rest,
})

package({ 'ellisonleao/glow.nvim', config = true, cmd = 'Glow' })

package({
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'marilari88/neotest-vitest',
    -- 'nvim-neotest/neotest-jest',
    'rouge8/neotest-rust',
    'thenbe/neotest-playwright',
    'nvim-neotest/neotest-go',
  },
  config = conf.neotest,
  event = { 'BufRead', 'BufNewFile' },
})
