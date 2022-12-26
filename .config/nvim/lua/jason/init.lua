vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
require('jason.packer')
require('jason.set')
require('jason.keymaps.base')
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
-- Keybinding locations -
-- keymaps/base.lua
-- /after/plugins/mason.lua for LSP stuff(sad I couldn't get this working in keymaps lol)
-- /after/plugins/neo-tree.lua for neo-tree stuff
-- probably some other places! What the fuck is lua? :))
