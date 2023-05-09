local package = require('core.pack').package
local conf = require('modules.tools.config')

package({
  'folke/neodev.nvim',
})

package({
  'glepnir/hlsearch.nvim',
  event = 'BufRead',
  config = function()
    require('hlsearch').setup()
  end,
})

package({
  'norcalli/nvim-colorizer.lua',
  ft = { 'lua', 'css', 'html', 'sass', 'less', 'typescriptreact', 'conf', 'config' },
  event = 'BufRead',
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
})

package({
  'christoomey/vim-tmux-navigator',
})

package({
  'sindrets/diffview.nvim',
  config = conf.diffview,
})

package({
  'MunifTanjim/nui.nvim',
})

-- package({
--   'TimUntersberger/neogit',
--   config = conf.neogit,
-- })

package({
  'kdheepak/lazygit.nvim',
})

package({
  'numToStr/Comment.nvim',
  config = conf.comment,
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
})

package({
  'rest-nvim/rest.nvim',
  config = conf.rest,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
})
