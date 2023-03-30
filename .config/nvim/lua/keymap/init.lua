local keymap = require('core.keymap')
local nmap, imap, cmap, xmap, vmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap, keymap.vmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = ' '

-- leaderkey
nmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

-- general binds
nmap({
  -- close buffer
  { 'Q', '<nop>' },
  {
    '<S-q>',
    cmd('bdelete!'),
    opts(noremap, silent, 'Delete current buffer'),
  },
  -- yank
  { 'Y', 'y$', opts(noremap, 'Yank EOL') },
  -- remove trailing white space
  { '<Leader>t', cmd('TrimTrailingWhitespace'), opts(noremap, 'Trim Trailing Whitespace') },
  -- remove highlights
  { '<Leader>ch', cmd('nohlsearch'), opts(silent, 'Clear highlights') },
  -- start/end line
  { 'H', '^' },
  { 'L', 'g_' },
  -- async format
  { '<Leader>lf', cmd('lua vim.lsp.buf.format{ async = true }'), opts(silent, 'Format file') },
  -- page up/down
  { '<C-d>', '<C-d>zz' },
  { '<c-u>', '<c-u>zz' },
  -- better next/prev
  { 'n', 'nzzzv' },
  { 'N', 'Nzzzv' },
  -- ?
  { '<Leader>S', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]] },
  -- chmod x
  { '<Leader>x', cmd('!chmod +x %'), opts(silent, 'chmod x') },
})

vmap({
  -- better paste
  { 'p', '"_dP', opts(silent) },
  -- visual indenting
  { '<', '<gv', opts(silent) },
  { '>', '>gv', opts(silent) },
  -- start/end line
  { 'H', '^' },
  { 'L', 'g_' },
})

-- usage of plugins
nmap({
  -- plugin manager: Lazy.nvim
  { '<Leader>pu', cmd('Lazy update'), opts(noremap, silent, 'Lazy update') },
  { '<Leader>pi', cmd('Lazy install'), opts(noremap, silent, 'Lazy install') },

  -- NeoTree
  { '<Leader>pv', require('oil').open_float, opts(silent, 'Project view') },

  -- Undo Tree
  { '<Leader>u', cmd('UndotreeToggle'), opts('Toggle Undo Tree') },

  -- NeoGit
  { '<Leader>ng', cmd('Neogit'), opts('Toggle NeoGit') },

  -- diffview
  { '<Leader>dvo', cmd('DiffviewOpen'), opts('Open Diffview') },
  { '<Leader>dvc', cmd('DiffviewClose'), opts('Close Diffview') },
  { '<Leader>fh', cmd('DiffviewFileHistory %'), opts('Toggle Diffview file history') },
})

-- Telescope
nmap({
  {
    '<Leader><space>',
    cmd('Telescope buffers'),
    opts(noremap, silent),
    opts('[ ] Find existing buffers'),
  },
  {
    '<Leader>sg',
    cmd('Telescope live_grep'),
    opts(noremap, silent, '[S]earch by [G]rep'),
  },
  {
    '<Leader>sf',
    cmd('Telescope find_files'),
    opts(noremap, silent, '[S]earch [F]iles'),
  },
  {
    '<Leader>sh',
    cmd('Telescope help_tags'),
    opts(noremap, silent, '[S]earch [H]elp'),
  },
  {
    '<Leader>sw',
    cmd('Telescope grep_string'),
    opts(noremap, silent, '[S]earch current [W]ord'),
  },
  {
    '<Leader>sd',
    cmd('Telescope diagnostics'),
    opts(noremap, silent, '[S]earch [D]iagnostics'),
  },
  {
    '<Leader>sr',
    cmd('Telescope resume'),
    opts(noremap, silent, '[S]earch [R]esume'),
  },
  {
    '<Leader>sm',
    cmd('Telescope keymaps'),
    opts(noremap, silent, '[S]how list of current user key[M]aps'),
  },
  {
    '<Leader>sb',
    cmd('Telescope current_buffer_fuzzy_find'),
    opts(noremap, silent, 'Fuzzily [S]earch in current [B]uffer]'),
  },
  {
    '<Leader>?',
    cmd('Telescope oldfiles'),
    opts(noremap, silent, '[?] Find recently opened files'),
  },
  {
    '<Leader>se',
    cmd('Telescope emoji'),
    opts(noremap, silent, '[S]earch [E]moji'),
  },
})

-- LSP binds
nmap({

  -- Toggle outline
  { '<Leader>o', cmd('Lspsaga outline'), opts('LSP: Toggle [O]utline') },

  -- Call hierarchy
  { '<Leader>ci', cmd('Lspsaga incoming_calls'), opts('LSP: Incoming Calls') },
  { '<Leader>co', cmd('Lspsaga outgoing_calls'), opts('LSP: Incoming Calls') },

  -- LSP Functionality
  { '<Leader>rn', cmd('Lspsaga rename'), opts('LSP: [R]e[n]ame') },
  { '<Leader>prn', cmd('Lspsaga rename ++project'), opts('LSP: [P]roject [R]e[n]ame') },
  { '<Leader>ca', cmd('Lspsaga code_action'), opts('LSP: [C]ode [A]ction') },

  -- LSP Goto
  { 'gh', cmd('Lspsaga lsp_finder'), opts('LSP: Symbol Info') },
  { 'gd', cmd('Lspsaga goto_definition'), opts('LSP: [G]oto [D]efinition') },
  { 'gr', require('telescope.builtin').lsp_references, opts('LSP: [G]oto [R]eferences') },
  { '<Leader>gt', cmd('Lspsaga goto_type_definition'), opts('LSP: [G]oto [T]ype definition') },

  -- LSP Peek
  { '<Leader>pt', cmd('Lspsaga peek_type_definition'), opts('LSP: [P]eek [T]ype definition') },
  { '<Leader>pd', cmd('Lspsaga peek_definition'), opts('LSP: [P]eek [D]efinition') },

  -- Diagnostics
  { '<Leader>dl', cmd('Lspsaga show_line_diagnostics'), opts('[D]iagnostics [L]ine') },
  { '<Leader>db', cmd('Lspsaga show_buf_diagnostics'), opts('[D]iagnostics [B]uffer') },

  -- Diagnostic jump
  { '[e', cmd('Lspsaga diagnostic_jump_prev'), opts('Diagnostics: Jump pref') },
  { ']e', cmd('Lspsaga diagnostic_jump_next'), opts('Diagnostics: Jump next') },

  -- Documentation
  { 'K', cmd('Lspsaga hover_doc'), opts('LSP: Hover Documentation') },

  -- LSPInfo
  {
    '<Leader>li',
    cmd('LspInfo'),
    opts(noremap, silent, ':LspInfo'),
  },
  {
    '<Leader>mi',
    cmd('Mason'),
    opts(noremap, silent, ':Mason'),
  },

  -- Symbols
  { '<Leader>ds', require('telescope.builtin').lsp_document_symbols, opts('LSP: [D]ocument [S]ymbols') },
  {
    '<Leader>ws',
    require('telescope.builtin').lsp_dynamic_workspace_symbols,
    opts('LSP: [W]orkspace [S]ymbols'),
  },
})

-- DAP
-- nmap({
--   { '<Leader>db', cmd('lua require"dap".toggle_breakpoint()'), opts(silent) },
--   { '<Leader>dc', cmd('lua require"dap".continue()'),          opts(silent) },
--   { '<Leader>di', cmd('lua require"dap".step_into()'),         opts(silent) },
--   { '<Leader>do', cmd('lua require"dap".step_over()'),         opts(silent) },
--   { '<Leader>dO', cmd('lua require"dap".step_out()'),          opts(silent) },
--   { '<Leader>dr', cmd('lua require"dap".repl.toggle()'),       opts(silent) },
--   { '<Leader>dl', cmd('lua require"dap".run_last()'),          opts(silent) },
--   { '<Leader>du', cmd('lua require"dapui".toggle()'),          opts(silent) },
--   { '<Leader>dt', cmd('lua require"dap".terminate()'),         opts(silent) },
--   { '<Leader>de', cmd('lua require"dapui".eval()'),            opts(silent) },
-- })
--
-- harpoon
local ui = require('harpoon.ui')
nmap({
  { '<Leader>h', require('harpoon.mark').add_file, opts('Harpoon file') },
  { '<C-e>', ui.toggle_quick_menu, opts('Open Harpoon UI') },
  {
    '<C-g>',
    function()
      ui.nav_file(1)
    end,
    opts('Harpoon 1'),
  },
  {
    '<C-b>',
    function()
      ui.nav_file(2)
    end,
    opts('Harpoon 2'),
  },
  {
    '<C-y>',
    function()
      ui.nav_file(3)
    end,
    opts('Harpoon 3'),
  },
  {
    '<C-n>',
    function()
      ui.nav_file(4)
    end,
    opts('Harpoon 4'),
  },
})
