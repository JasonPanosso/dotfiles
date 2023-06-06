local keymap = require('core.keymap')
local nmap, imap, cmap, xmap, vmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap, keymap.vmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd
local cmdredraw = keymap.cmdredraw

-- Use space as leader key
vim.g.mapleader = ' '

-- leaderkey
nmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

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
  { '<Leader>ch', cmd('nohlsearch'), opts('Clear highlights', noremap) },
  -- start/end line
  { 'H', '^', opts(noremap) },
  { 'L', 'g_', opts(noremap) },
  -- async format
  { '<Leader>lf', cmdredraw('lua vim.lsp.buf.format{ async = true }'), opts('Format file', noremap) },
  -- page up/down
  { '<C-d>', '<C-d>zz', opts(noremap) },
  { '<C-f>', '<C-u>zz', opts(noremap) },
  { '<C-u>', '<C-u>zz', opts(noremap) },
  -- better next/prev
  { 'n', 'nzzzv', opts(noremap) },
  { 'N', 'Nzzzv', opts(noremap) },
  -- ?
  { '<Leader>S', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts(noremap) },
  -- chmod x
  { '<Leader>x', cmd('!chmod +x %'), opts('chmod x', silent, noremap) },
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
  { '<Leader>ca', cmd('Lspsaga code_action'), opts('LSP: [C]ode [A]ction', noremap) },
})

-- plugin keymaps
nmap({
  -- plugin manager: Lazy.nvim
  { '<Leader>pu', cmd('Lazy update'), opts('Lazy [P]lugin [U]pdate', noremap) },
  { '<Leader>pi', cmd('Lazy install'), opts('Lazy [P]lugin [I]nstall', noremap) },

  -- Oil
  { '<Leader>pv', cmd('lua require("oil").open_float()'), opts('[P]roject [V]iew', noremap) },

  -- Undo Tree
  { '<Leader>u', cmd('UndotreeToggle'), opts('[U]ndo Tree', noremap) },

  -- LazyGit
  { '<Leader>go', cmd('LazyGit'), opts('Open LazyGit', noremap) },
  { '<Leader>gc', cmd('LazyGitConfig'), opts('Open LazyGit', noremap) },

  -- diffview
  { '<Leader>dvo', cmd('DiffviewOpen'), opts('[D]iff[V]iew [O]pen', noremap) },
  { '<Leader>dvc', cmd('DiffviewClose'), opts('[D]iff[V]iew [C]lose', noremap) },
  { '<Leader>dvfh', cmd('DiffviewFileHistory %'), opts('[D]iff[V]iew [F]ile [H]istory', noremap) },

  -- rest
  { '<Leader>rc', cmd('lua require"rest-nvim".run()'), opts('[R]est [C]ursor', noremap) },
  { '<Leader>rp', cmd('lua require"rest-nvim".run(true)'), opts('[R]est [P]review request', noremap) },
  { '<Leader>rl', cmd('lua require"rest-nvim".last()'), opts('[R]est run [L]ast', noremap) },
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
    '<Leader>se',
    cmd('Telescope emoji'),
    opts(noremap, '[S]earch [E]moji'),
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
  { '<Leader>ci', cmd('Lspsaga incoming_calls'), opts('LSP: Incoming Calls', noremap) },
  { '<Leader>co', cmd('Lspsaga outgoing_calls'), opts('LSP: Outgoing Calls', noremap) },

  -- LSP Functionality
  { '<Leader>rn', cmd('Lspsaga rename'), opts('LSP: [R]e[n]ame', noremap) },
  { '<Leader>prn', cmd('Lspsaga rename ++project'), opts('LSP: [P]roject [R]e[n]ame', noremap) },
  { '<Leader>ca', cmd('Lspsaga code_action'), opts('LSP: [C]ode [A]ction', noremap) },

  -- LSP Goto
  { 'gh', cmd('Lspsaga lsp_finder'), opts('LSP: Symbol Info', noremap) },
  { 'gd', cmd('Lspsaga goto_definition'), opts('LSP: [G]oto [D]efinition', noremap) },
  { 'gr', cmd('lua require("telescope.builtin").lsp_references()'), opts('LSP: [G]oto [R]eferences', noremap) },
  { 'gt', cmd('Lspsaga goto_type_definition'), opts('LSP: [G]oto [T]ype definition', noremap) },

  -- LSP Peek
  { '<Leader>pt', cmd('Lspsaga peek_type_definition'), opts('LSP: [P]eek [T]ype definition', noremap) },
  { '<Leader>pd', cmd('Lspsaga peek_definition'), opts('LSP: [P]eek [D]efinition', noremap) },

  -- Diagnostics
  { '<Leader>dl', cmd('Lspsaga show_line_diagnostics'), opts('[D]iagnostics [L]ine', noremap) },
  { '<Leader>db', cmd('Lspsaga show_buf_diagnostics'), opts('[D]iagnostics [B]uffer', noremap) },
  { '<Leader>dw', cmd('Lspsaga show_cursor_diagnostics'), opts('[D]iagnostics [C]ursor', noremap) },

  -- Diagnostic jump
  { '[e', cmd('Lspsaga diagnostic_jump_prev'), opts('Diagnostics: Jump pref', noremap) },
  { ']e', cmd('Lspsaga diagnostic_jump_next'), opts('Diagnostics: Jump next', noremap) },

  -- Documentation
  { 'K', cmd('Lspsaga hover_doc'), opts('LSP: Hover Documentation', noremap) },
  { '<Leader>K', cmd('Lspsaga hover_doc ++keep'), opts('LSP: Keep Hover Documentation', noremap) },
  { '<Leader>k', vim.lsp.buf.signature_help, opts('LSP: Signature Help', noremap) },

  -- LSPInfo
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
    cmd('lua require("telescope.builtin").lsp_document_symbols'),
    opts('LSP: [D]ocument [S]ymbols', noremap),
  },
  {
    '<Leader>ws',
    cmd('lua require("telescope.builtin").lsp_dynamic_workspace_symbols()'),
    opts('LSP: [W]orkspace [S]ymbols', noremap),
  },
})

-- DAP
nmap({
  { '<Leader>db', cmd('lua require"dap".toggle_breakpoint()'), opts(noremap) },
  { '<Leader>dB', cmd('lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))'), opts(noremap) },
  { '<Leader>lp', cmd('lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))'), opts(noremap) },
  { '<Leader>dc', cmd('lua require"dap".continue()'), opts(noremap) },
  { '<Leader>dr', cmd('lua require"dap".step_into()'), opts(noremap) },
  { '<Leader>df', cmd('lua require"dap".step_over()'), opts(noremap) },
  { '<Leader>dv', cmd('lua require"dap".step_out()'), opts(noremap) },
  { '<Leader>dp', cmd('lua require"dap".repl.toggle()'), opts(noremap) },
  { '<Leader>dd', cmd('lua require"dap".run_last()'), opts(noremap) },
  { '<Leader>dt', cmd('lua require"dapui".toggle()'), opts(noremap) },
  { '<Leader>dx', cmd('lua require"dap".terminate()'), opts(noremap) },
  { '<Leader>de', cmd('lua require"dapui".eval()'), opts(noremap) },
})
--
-- harpoon
local ui = require('harpoon.ui')
nmap({
  { '<Leader>a', cmdredraw('lua require("harpoon.mark").add_file()'), opts('Harpoon file', noremap) },
  { '<Leader>h', cmd('lua require("harpoon.ui").toggle_quick_menu()'), opts('[H]arpoon UI', noremap) },
  {
    '<Leader>t',
    function()
      ui.nav_file(1)
    end,
    opts('Harpoon 1', noremap),
  },
  {
    '<Leader>b',
    function()
      ui.nav_file(2)
    end,
    opts('Harpoon 2', noremap),
  },
  {
    '<Leader>y',
    function()
      ui.nav_file(3)
    end,
    opts('Harpoon 3', noremap),
  },
  {
    '<Leader>n',
    function()
      ui.nav_file(4)
    end,
    opts('Harpoon 4', noremap),
  },
  {
    '<Leader>1',
    function()
      ui.nav_file(1)
    end,
    opts('Harpoon 1', noremap),
  },
  {
    '<Leader>2',
    function()
      ui.nav_file(2)
    end,
    opts('Harpoon 2', noremap),
  },
  {
    '<Leader>3',
    function()
      ui.nav_file(3)
    end,
    opts('Harpoon 3', noremap),
  },
  {
    '<Leader>4',
    function()
      ui.nav_file(4)
    end,
    opts('Harpoon 4', noremap),
  },
  {
    '<Leader>5',
    function()
      ui.nav_file(5)
    end,
    opts('Harpoon 5', noremap),
  },
  {
    '<Leader>6',
    function()
      ui.nav_file(6)
    end,
    opts('Harpoon 6', noremap),
  },
  {
    '<Leader>7',
    function()
      ui.nav_file(7)
    end,
    opts('Harpoon 7', noremap),
  },
  {
    '<Leader>8',
    function()
      ui.nav_file(8)
    end,
    opts('Harpoon 8', noremap),
  },
  {
    '<Leader>9',
    function()
      ui.nav_file(9)
    end,
    opts('Harpoon 9', noremap),
  },
})
