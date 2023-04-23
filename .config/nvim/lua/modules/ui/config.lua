local config = {}

function config.kanagawa()
  vim.cmd('colorscheme kanagawa')
end

function config.alpha()
  local alpha = require('alpha')
  local db = require('alpha.themes.dashboard')
  db.section.header.val = {
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠠⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⡀⠀⠙⢶⣄⠀⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⢠⣶⣦⣤⣀⣀⣤⣤⣄⣀⠀⢀⣀⣴⠂⠀⠀⠀⠀⠀⠀⠀⠐⠉⠉⣉⣉⣽⣿⣿⣷⣾⣿⣷⣄⡸⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠿⠿⢿⣿⣿⣿⣭⣭⣿⣿⣿⣿⣟⣁⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠶⠤⠀⠀⢠⡾⢿⣿⣿⣿⣿⡿⠉⠀⠀⠀⠈⠙⢻⣿⣿⣿⡛⢻⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠋⠀⠀⠀⠉⠻⣿⣿⣿⣿⣦⡀⠀⠁⠀⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣦⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣯⡙⢦⠀⠀⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠙⠻⠿⠿⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⡄⠀⠀⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠰⣄⠀⠀⠀⠀⠈⠛⢿⣿⡏⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⡝⡇⠀⠀⠹⡇⠙⢿⣿⣿⣿⣿⣿⣶⣦⣄⣀⣈⣳⣶⣤⣤⣄⣀⠈⠋⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⡇⠁⠀⠀⠀⠙⣠⠤⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡛⠻⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠈⢲⡄⠀⢀⡠⠔⠂⠀⠀⠀⠀⣸⣿⣿⣿⡿⢹⠇⠀⠀⠀⠀⠈⢀⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⡟⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⣾⣧⣾⣿⣶⣶⣶⣤⣀⠀⠀⣿⣿⣿⣿⠇⠋⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⠟⠛⢿⣿⣿⣿⣿⡄⠀⠻⣿⡿⠿⠛⠛⠛⠛⠿⡿⠀⠀⠀⠀]],
    [[⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣷⣮⡁⠀⣿⣿⣿⣿⠀⠀⠀⠀⠀⢠⠞⣻⣿⣿⣿⡿⠁⠀⠀⠈⣿⣿⣿⣿⣧⠀⠀⠀⢀⡀⠀⠀⠀⣴⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⢠⡿⢹⣿⣿⡋⠀⠈⢻⣿⣿⣿⡟⠆⢻⣿⣿⣿⡇⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⡇⠀⠀⠀⠀⢸⣿⣿⣿⣿⠀⠀⠀⣀⣭⣽⣶⣬⣿⡄⠀⠀⠀⠀⠀]],
    [[⠀⠀⣰⣷⣿⣿⠿⠃⠀⠀⢸⣿⣿⣿⣿⡄⠘⣿⣿⣿⣿⣄⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⣾⣿⣿⣿⣿⠀⠴⣻⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀]],
    [[⠀⣴⣿⡿⠋⠀⠀⠀⠀⠀⣼⣿⣿⣿⢿⡇⠀⠘⣿⣿⣿⣿⣦⡀⠀⠀⢸⡟⢿⣿⣿⣿⣿⣧⡀⣰⣿⣿⣿⣿⡏⠀⣼⣿⣿⣿⠋⠀⠉⣿⣿⣌⣷⠀⠀⠀]],
    [[⠀⠈⠛⠁⠀⠀⠀⠀⠀⢸⣿⣿⣿⡏⠘⠀⠀⠀⠈⢻⣿⣿⣿⣿⣷⣤⡀⠳⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠈⣿⣿⣿⣿⠀⠀⠈⠛⠻⢿⣿⣷⡄⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿⣷⣶⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⣿⢿⣿⣿⣧⡀⠀⠀⠀⠀⠈⠿⠇⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠘⠌⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣶⣶⣤⣤⣤⣄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⢀⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣀⣤⣤⣴⣾⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⡀⠀⠀⢤⣬⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠠⠾⣿⣿⣿⣶⣤⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣠⣶⣦⣄⡀⠀⠀⣶⢒⠲⣄]],
    [[⣾⣥⣤⣼⣿⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⣵⣾⡿]],
  }
  db.section.buttons.val = {
    db.button('f', ' ' .. ' Find file', ':Telescope find_files <CR>'),
    db.button('e', ' ' .. ' New file', ':ene <BAR> startinsert <CR>'),
    -- db.button('p', ' ' .. ' Find project', ":lua require('telescope').extensions.projects.projects()<CR>"),
    db.button('q', ' ' .. ' Quit', ':qa<CR>'),
  }
  -- local function footer()
  --   return 'Jason Panosso'
  -- end
  --
  -- db.section.footer.val = footer()

  db.section.footer.opts.hl = 'Type'
  db.section.header.opts.hl = 'Include'
  db.section.buttons.opts.hl = 'Keyword'

  db.opts.opts.noautocmd = true

  alpha.setup(db.opts)
end

function config.lualine()
  local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end

  local diagnostics = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    sections = { 'error', 'warn' },
    symbols = { error = ' ', warn = ' ' },
    colored = false,
    always_visible = true,
  }

  local diff = {
    'diff',
    colored = false,
    symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
    cond = hide_in_width,
  }

  local filetype = {
    'filetype',
    icons_enabled = true,
  }

  local location = {
    'location',
    padding = 0,
  }

  local spaces = function()
    return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
  end
  require('lualine').setup({
    options = {
      globalstatus = true,
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = { 'alpha', 'dashboard' },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { 'filename' },
      lualine_x = { diagnostics, diff, spaces, 'encoding', filetype },
      lualine_y = { location },
      lualine_z = { 'progress' },
    },
  })
end

function config.indent_blankline()
  require('indent_blankline').setup({
    char = '│',
    use_treesitter = true,
    use_treesitter_scope = false,
    show_first_indent_level = true,
    show_current_context = true,
    filetype_exclude = {
      'dashboard',
      'log',
      'TelescopePrompt',
    },
    buftype_exclude = { 'terminal', 'nofile', 'prompt' },
  })
end

function config.gitsigns()
  require('gitsigns').setup({
    signs = {
      add = { hl = 'GitSignsAdd', text = '▎', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      change = { hl = 'GitSignsChange', text = '▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      delete = { hl = 'GitSignsDelete', text = '契', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
      topdelete = { hl = 'GitSignsDelete', text = '契', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
      changedelete = { hl = 'GitSignsChange', text = '▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    preview_config = {
      -- Options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1,
    },
  })
end

function config.oil()
  require('oil').setup({
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ['g?'] = 'actions.show_help',
      ['<CR>'] = 'actions.select',
      ['<C-s>'] = 'actions.select_vsplit',
      ['<C-h>'] = 'actions.select_split',
      ['<C-t>'] = 'actions.select_tab',
      ['<C-p>'] = 'actions.preview',
      ['<esc>'] = 'actions.close',
      ['<C-r>'] = 'actions.refresh',
      ['<BS>'] = 'actions.parent',
      ['_'] = 'actions.open_cwd',
      ['`'] = 'actions.cd',
      ['~'] = 'actions.tcd',
      ['g.'] = 'actions.toggle_hidden',
    },
    float = {
      padding = 10,
      max_width = 60,
      win_options = {
        winblend = 0,
      },
    },
  })
end

return config
