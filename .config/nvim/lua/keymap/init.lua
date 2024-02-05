local keymap = require('core.keymap')
local nmap, xmap, vmap = keymap.nmap, keymap.xmap, keymap.vmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd
local cmdredraw = keymap.cmdredraw

-- Use space as leader key
vim.g.mapleader = ' '

-- leaderkey
nmap({ ' ', '', opts(noremap) })
vmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

-- TEST
nmap({ '<Leader>sp', cmd('source ~/Projects/harpoon-tabline/lua/init.lua'), opts(noremap) })

-- general binds
nmap({
  -- move lines
  { '<A-j>', cmd('m+'), opts('Move line down', noremap) },
  { '<A-k>', cmd('m-2'), opts('Move line up', noremap) },

  -- close buffer
  { 'Q', '<nop>', opts(noremap) },
  {
    '<S-q>',
    cmd('bdelete!'),
    opts(noremap, 'Delete current buffer'),
  },

  -- yank
  { 'Y', 'y$', opts('Yank EOL', noremap) },

  -- <C-a> -> <C-g> to get around tmux prefix
  { '<C-g>', '<C-a>', opts('Increment/Decrement number', noremap) },

  -- remove highlights
  { '<Leader>ch', cmd('nohlsearch'), opts('[C]lear [H]ighlights', noremap) },

  -- start/end line
  { 'H', '^', opts(noremap) },
  { 'L', 'g_', opts(noremap) },

  -- async format
  { '<Leader>lf', cmdredraw('FormatWrite'), opts('[L]sp [F]ormat', noremap) },

  -- page up/down
  { '<C-d>', '<C-d>zz', opts(noremap) },
  { '<C-u>', '<C-u>zz', opts(noremap) },

  -- better next/prev
  { 'n', 'nzzzv', opts(noremap) },
  { 'N', 'Nzzzv', opts(noremap) },

  -- ?
  { '<Leader>S', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts(noremap) },

  -- chmod x
  { '<Leader>x', cmd('!chmod +x %'), opts('chmod x', silent, noremap) },

  -- alt file
  { '<C-^>', cmd('b#'), opts(noremap) },

  -- lsp restart
  { '<Leader>lr', cmd('LspStop<CR>:sleep 100m<CR>:LspStart'), opts(noremap) },

  -- better gx
  { 'gx', cmd('lua require("core.utils").gx()'), opts(noremap, silent) },
})

vmap({
  -- better paste
  { 'p', '"_dP', opts(noremap) },

  -- visual indenting
  { '<', '<gv', opts(noremap) },
  { '>', '>gv', opts(noremap) },

  -- start/end line
  { 'H', '^', opts(noremap) },
  { 'L', 'g_', opts(noremap) },

  -- Code action in visual mode
  { '<Leader>ca', cmd('lua require("actions-preview").code_actions()'), opts('LSP: [C]ode [A]ction', noremap) },

  -- alt file
  { '<C-^>', cmd('b#'), opts(noremap) },
})

-- plugin keymaps
nmap({
  -- plugin manager: Lazy.nvim
  { '<Leader>pi', cmd('Lazy home'), opts('[P]lugin  [I]nstall', noremap) },

  -- Oil
  { '<Leader>pv', cmd('lua require("oil").open_float()'), opts('[P]roject [V]iew', noremap) },

  -- Undo Tree
  { '<Leader>u', cmd('UndotreeToggle'), opts('[U]ndo Tree', noremap) },

  -- LazyGit
  { '<Leader>go', cmd('LazyGit'), opts('[G]it [O]pen', noremap) },

  -- rest
  { '<Leader>rx', '<Plug>RestNvim', opts('[R]est e[X]ecute', noremap) },
  { '<Leader>rp', '<Plug>RestNvimPreview', opts('[R]est [P]review', noremap) },
  { '<Leader>rl', '<Plug>RestNvimLast', opts('[R]est [L]ast', noremap) },

  -- glow
  { '<Leader>md', cmd('Glow'), opts('[M]ark[D]own render', noremap) },

  -- neotest
  { '<Leader>tr', cmd('lua require("neotest").run.run()'), opts('[T]est [R]un', noremap) },
  { '<Leader>tf', cmd('lua require("neotest").run.run(vim.fn.expand("%"))'), opts('[T]est [F]ile', noremap) },
  { '<Leader>td', cmd('lua require("neotest").run.run({strategy = "dap"})'), opts('[T]est [D]ebug', noremap) },
  { '<Leader>tw', cmd('lua require("neotest").run.run(vim.fn.getcwd())'), opts('[T]est [W]orkspace', noremap) },
  { '<Leader>tx', cmd('lua require("neotest").run.stop()'), opts('[T]est [X]', noremap) },
  { '<Leader>ts', cmd('lua require("neotest").summary.toggle()'), opts('[T]est [S]ummary', noremap) },
  { '<Leader>to', cmd('lua require("neotest").output.open({ enter = true })'), opts('[T]est [O]utput', noremap) },
  { '<Leader>ta', cmd('lua require("neotest").run.attach()'), opts('[T]est [A]ttach', noremap) },
  { '<Leader>tl', cmd('lua require("neotest").run.run_last()'), opts('[T]est [L]ast', noremap) },
})

-- Telescope
nmap({
  {
    '<Leader><space>',
    cmd('Telescope buffers'),
    opts('[ ] Find existing buffers', noremap),
  },
  {
    '<Leader>sg',
    cmd('Telescope live_grep'),
    opts(noremap, '[S]earch by [G]rep'),
  },
  {
    '<Leader>sf',
    cmd('Telescope find_files'),
    opts(noremap, '[S]earch [F]iles'),
  },
  {
    '<Leader>sh',
    cmd('Telescope help_tags'),
    opts(noremap, '[S]earch [H]elp'),
  },
  {
    '<Leader>sw',
    cmd('Telescope grep_string'),
    opts(noremap, '[S]earch current [W]ord'),
  },
  {
    '<Leader>sd',
    cmd('Telescope diagnostics'),
    opts(noremap, '[S]earch [D]iagnostics'),
  },
  {
    '<Leader>sr',
    cmd('Telescope resume'),
    opts(noremap, '[S]earch [R]esume'),
  },
  {
    '<Leader>sm',
    cmd('Telescope keymaps'),
    opts(noremap, '[S]earch Key[M]aps'),
  },
  {
    '<Leader>sb',
    cmd('Telescope current_buffer_fuzzy_find'),
    opts(noremap, '[S]earch [B]uffer] Fuzzily'),
  },
  {
    '<Leader>?',
    cmd('Telescope oldfiles'),
    opts(noremap, '[?] Find recently opened files'),
  },
  {
    '<Leader>sc',
    cmd('Telescope dap commands'),
    opts(noremap, '[S]earch DAP [C]ommands'),
  },
})

-- LSP binds
nmap({

  -- Toggle outline
  { '<Leader>o', cmd('Lspsaga outline'), opts('LSP: Toggle [O]utline', noremap) },

  -- Call hierarchy
  { '<Leader>ci', cmd('lua require("telescope.builtin").lsp_incoming_calls()'), opts('LSP: Incoming Calls', noremap) },
  { '<Leader>co', cmd('lua require("telescope.builtin").lsp_outgoing_calls()'), opts('LSP: Outgoing Calls', noremap) },

  -- LSP Functionality
  { '<Leader>rn', cmd('Lspsaga rename'), opts('LSP: [R]e[n]ame', noremap) },
  { '<Leader>prn', cmd('Lspsaga rename ++project'), opts('LSP: [P]roject [R]e[n]ame', noremap) },
  { '<Leader>ca', cmd('lua require("actions-preview").code_actions()'), opts('LSP: [C]ode [A]ction', noremap) },

  -- LSP Goto
  { 'gh', cmd('Lspsaga lsp_finder'), opts('LSP: Symbol Info', noremap) },
  { 'gd', cmd('Lspsaga goto_definition'), opts('LSP: [G]oto [D]efinition', noremap) },
  { 'gr', cmd('lua require("telescope.builtin").lsp_references()'), opts('LSP: [G]oto [R]eferences', noremap) },
  {
    'gt',
    cmd('Lspsaga goto_type_definition'),
    opts('LSP: [G]oto [T]ype definition', noremap),
  },
  {
    'gi',
    cmd('lua require("telescope.builtin").lsp_implementations()'),
    opts('LSP: [G]oto [I]mplementations', noremap),
  },
  {
    'gs',
    cmd('TSToolsGoToSourceDefinition'),
    opts('LSP: [G]oto [S]ource', noremap),
  },

  -- LSP Peek
  { '<Leader>pt', cmd('Lspsaga peek_type_definition'), opts('LSP: [P]eek [T]ype definition', noremap) },
  { '<Leader>pd', cmd('Lspsaga peek_definition'), opts('LSP: [P]eek [D]efinition', noremap) },

  -- Diagnostics
  { '<Leader>dl', cmd('Lspsaga show_line_diagnostics'), opts('[D]iagnostics [L]ine', noremap) },
  -- { '<Leader>dl', vim.diagnostic.open_float, opts('[D]iagnostics [L]ine', noremap) },
  {
    '<Leader>db',
    cmd('lua require("telescope.builtin").diagnostics({bufnr=0})'),
    opts('[D]iagnostics [B]uffers', noremap),
  },
  {
    '<Leader>dw',
    cmd('lua require("telescope.builtin").diagnostics()'),
    opts('[D]iagnostics [W]orkspace', noremap),
  },
  { '<Leader>dc', cmd('Lspsaga show_cursor_diagnostics'), opts('[D]iagnostics [C]ursor', noremap) },
  { '[e', cmd('Lspsaga diagnostic_jump_prev'), opts('Diagnostics: Jump prev', noremap) },
  { ']e', cmd('Lspsaga diagnostic_jump_next'), opts('Diagnostics: Jump next', noremap) },

  -- Documentation
  {
    'K',
    vim.lsp.buf.hover,
    opts('LSP: Hover Documentation', noremap, silent),
  },
  { '<Leader>K', cmd('Lspsaga hover_doc ++keep'), opts('LSP: Keep Hover Documentation', noremap) },
  { '<Leader>k', vim.lsp.buf.signature_help, opts('LSP: Signature Help', noremap) },

  -- LSP
  {
    '<Leader>li',
    cmd('LspInfo'),
    opts(':LspInfo', noremap),
  },
  {
    '<Leader>mi',
    cmd('Mason'),
    opts(':Mason', noremap),
  },

  -- Symbols
  {
    '<Leader>ds',
    cmd('lua require("telescope.builtin").lsp_document_symbols()'),
    opts('LSP: [D]ocument [S]ymbols', noremap),
  },
  {
    '<Leader>ws',
    cmd('lua require("telescope.builtin").lsp_dynamic_workspace_symbols()'),
    opts('LSP: [W]orkspace [S]ymbols', noremap),
  },
})

-- DAP
-- nmap({
-- { '<Leader>db', cmd('lua require"dap".toggle_breakpoint()'), opts(noremap) },
-- { '<Leader>dB', cmd('lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))'), opts(noremap) },
--   {
--     '<Leader>lp',
--     cmd('lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))'),
--     opts(noremap),
--   },
--   { '<Leader>dc', cmd('lua require"dap".continue()'), opts(noremap) },
--   { '<Leader>dr', cmd('lua require"dap".step_into()'), opts(noremap) },
--   { '<Leader>df', cmd('lua require"dap".step_over()'), opts(noremap) },
--   { '<Leader>dv', cmd('lua require"dap".step_out()'), opts(noremap) },
--   { '<Leader>dp', cmd('lua require"dap".repl.toggle()'), opts(noremap) },
--   { '<Leader>dd', cmd('lua require"dap".run_last()'), opts(noremap) },
--   { '<Leader>dt', cmd('lua require"dapui".toggle()'), opts(noremap) },
--   { '<Leader>dx', cmd('lua require"dap".terminate()'), opts(noremap) },
--   { '<Leader>de', cmd('lua require"dapui".eval()'), opts(noremap) },
-- })

-- harpoon
local harpoon = require('harpoon')
nmap({
  {
    '<Leader>a',
    function()
      harpoon:list():append()
      vim.cmd('redraw!')
    end,
    opts('Harpoon file', noremap),
  },
  {
    '<Leader>h',
    function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end,
    opts('[H]arpoon UI', noremap),
  },
  {
    '<Leader>1',
    function()
      harpoon:list():select(1)
    end,
    opts('Harpoon 1', noremap),
  },
  {
    '<Leader>2',
    function()
      harpoon:list():select(2)
    end,
    opts('Harpoon 2', noremap),
  },
  {
    '<Leader>3',
    function()
      harpoon:list():select(3)
    end,
    opts('Harpoon 3', noremap),
  },
  {
    '<Leader>4',
    function()
      harpoon:list():select(4)
    end,
    opts('Harpoon 4', noremap),
  },
  {
    '<Leader>5',
    function()
      harpoon:list():select(5)
    end,
    opts('Harpoon 5', noremap),
  },
  {
    '<Leader>6',
    function()
      harpoon:list():select(6)
    end,
    opts('Harpoon 6', noremap),
  },
  {
    '<Leader>7',
    function()
      harpoon:list():select(7)
    end,
    opts('Harpoon 7', noremap),
  },
  {
    '<Leader>8',
    function()
      harpoon:list():select(8)
    end,
    opts('Harpoon 8', noremap),
  },
  {
    '<Leader>9',
    function()
      harpoon:list():select(9)
    end,
    opts('Harpoon 9', noremap),
  },
})
