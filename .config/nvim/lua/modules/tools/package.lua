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
  lazy = false,
  config = function()
    vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
    vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
    vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
    vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
    vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')
    require('harpoon').setup({
      opts = {
        tabline = true,
        mark_branch = true,
      },
    })
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
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
})
