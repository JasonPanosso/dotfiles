local config = {}

function config.lua_snip()
  local ls = require('luasnip')
  local types = require('luasnip.util.types')
  ls.config.set_config({
    history = true,
    enable_autosnippets = true,
    updateevents = 'TextChanged,TextChangedI',
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { '<- choiceNode', 'Comment' } },
        },
      },
    },
  })
  require('luasnip.loaders.from_vscode').lazy_load()
  require('luasnip.loaders.from_vscode').lazy_load({
    paths = { './snippets/' },
  })
end

function config.telescope()
  local fb_actions = require('telescope').extensions.file_browser.actions
  local actions = require('telescope.actions')
  require('telescope').setup({
    defaults = {
      path_display = { 'smart' },
      mappings = {
        n = {
          ['q'] = actions.close,
        },
        i = {
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
          ['<C-n>'] = actions.move_selection_next,
          ['<C-p>'] = actions.move_selection_previous,
        },
      },
      prompt_prefix = ' ',
      selection_caret = ' ',
      layout_config = {
        horizontal = { prompt_position = 'bottom', results_width = 0.6 },
        vertical = { mirror = false },
      },
      sorting_strategy = 'ascending',
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
      file_browser = {
        mappings = {
          ['n'] = {
            ['c'] = fb_actions.create,
            ['r'] = fb_actions.rename,
            ['d'] = fb_actions.remove,
            ['o'] = fb_actions.open,
            ['u'] = fb_actions.goto_parent_dir,
          },
        },
      },
    },
  })
  require('telescope').load_extension('fzy_native')
  require('telescope').load_extension('file_browser')
  require('telescope').load_extension('projects')
  require('telescope').load_extension('emoji')
end

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

  require('nvim-treesitter.configs').setup({
    ensure_installed = 'all',
    ignore_install = { 'phpdoc', 'sql' },
    highlight = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
    },
    -- ts autotag
    autotag = {
      enable = true,
    },
  })

  -- postgresql parser
  local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
  parser_config.postgres = {
    install_info = {
      url = '$HOME/Projects/tree-sitter-sql', -- local path or git repo
      files = { 'src/parser.c', 'src/scanner.cc' }, -- note that some parsers also require src/scanner.c or src/scanner.cc
      -- optional entries:
      branch = 'main', -- default branch in case of git repo if different from master
      -- generate_requires_npm = false, -- if stand-alone parser without npm dependencies
      requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
      filetype = "sql',",
    },
  }

  --set indent for jsx tsx
  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'javascriptreact', 'typescriptreact' },
    callback = function(opt)
      vim.bo[opt.buf].indentexpr = 'nvim_treesitter#indent()'
    end,
  })
end

return config
