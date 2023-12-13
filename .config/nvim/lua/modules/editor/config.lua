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
  local actions = require('telescope.actions')

  require('telescope').setup({
    defaults = {
      file_ignore_patterns = { 'node_modules', '_Index' },
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
        horizontal = { prompt_position = 'bottom', preview_width = 0.5, results_width = 0.5 },
        vertical = { mirror = false },
      },
      sorting_strategy = 'ascending',
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--trim',
      },
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
  })

  require('telescope').load_extension('fzy_native')
  require('telescope').load_extension('projects')
end

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

  -- postgresql parser
  -- local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
  --
  -- -- this is the recommended way to do it, idk why LuaLS mad
  -- ---@diagnostic disable: inject-field
  -- parser_config.postgres = {
  --   install_info = {
  --     url = '$HOME/Projects/tree-sitter-sql',
  --     files = { 'src/parser.c', 'src/scanner.cc' },
  --     branch = 'main',
  --     requires_generate_from_grammar = true,
  --     filetype = "sql',",
  --   },
  -- }

  require('luau-lsp').treesitter()

  -- known LuaLS bug https://github.com/nvim-treesitter/nvim-treesitter/issues/5297
  ---@diagnostic disable: missing-fields
  require('nvim-treesitter.configs').setup({
    sync_install = true,
    ensure_installed = 'all',
    auto_install = true,
    ignore_install = { 'phpdoc', 'sql', 'luau' },
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
          ['ia'] = '@parameter.inner',
          ['aa'] = '@parameter.outer',
        },
      },
    },
  })
  require('ts_context_commentstring').setup({})
  require('nvim-ts-autotag').setup({})

  --set indent for jsx tsx
  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'javascriptreact', 'typescriptreact' },
    callback = function(opt)
      vim.bo[opt.buf].indentexpr = 'nvim_treesitter#indent()'
    end,
  })
end

function config.formatter()
  local util = require('formatter.util')

  ---@diagnostic disable: undefined-field why?
  require('formatter').setup({
    filetype = {
      lua = {
        require('formatter.filetypes.lua').stylua,
      },
      luau = {
        require('formatter.filetypes.lua').stylua,
      },
      svelte = {
        function()
          return {
            exe = 'prettier',
            args = {
              '--stdin-filepath',
              util.escape_path(util.get_current_buffer_file_path()),
              '--plugin=prettier-plugin-svelte',
              -- '--parser',
              -- 'svelte',
            },
            stdin = true,
            try_node_modules = true,
          }
        end,
      },
      typescript = {
        function()
          -- this is janky, need a recursive search or something.. zz
          if vim.fn.filereadable(util.get_cwd() .. '/dprint.json') == 1 then
            return {
              exe = 'dprint',
              args = { 'fmt', '--stdin', util.escape_path(util.get_current_buffer_file_path()) },
              stdin = true,
            }
          else
            return {
              exe = 'prettierd',
              args = { util.escape_path(util.get_current_buffer_file_path()) },
              stdin = true,
            }
          end
        end,
      },
      javascript = {
        require('formatter.filetypes.javascript').prettierd,
      },
      typescriptreact = {
        require('formatter.filetypes.typescriptreact').prettierd,
      },
      javascriptreact = {
        require('formatter.filetypes.javascriptreact').prettierd,
      },
      markdown = {
        require('formatter.filetypes.markdown').prettierd,
      },
      json = {
        require('formatter.filetypes.json').prettierd,
      },
      jsonc = {
        require('formatter.filetypes.json').prettierd,
      },
      css = {
        require('formatter.filetypes.css').prettierd,
      },
      sql = {
        function()
          return {
            exe = 'sqlfluff',
            args = { 'fix', '--disable-progress-bar', '-f', '-n', '--dialect postgres', '-' },
            stdin = true,
          }
        end,
      },
      python = {
        require('formatter.filetypes.python').black,
      },
      go = {
        require('formatter.filetypes.go').gofmt,
      },
      rust = {
        require('formatter.filetypes.rust').rustfmt,
      },
      html = {
        require('formatter.filetypes.html').prettierd,
      },
      sh = {
        require('formatter.filetypes.zsh').beautysh,
      },
      zsh = {
        require('formatter.filetypes.zsh').beautysh,
      },
      yaml = {
        require('formatter.filetypes.yaml').prettierd,
      },
      toml = {
        require('formatter.filetypes.toml').taplo,
      },
      ['*'] = {
        require('formatter.filetypes.any').remove_trailing_whitespace,
      },
    },
  })
end

return config
