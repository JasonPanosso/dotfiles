local config = {}

function config.nvim_lsp()
  require('modules.lsp.lspconfig')
end

function config.nvim_cmp()
  local cmp = require('cmp')
  local lspkind = require('lspkind')
  cmp.setup({
    preselect = cmp.PreselectMode.Item,
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol_text',
        menu = {
          buffer = '[Buffer]',
          nvim_lsp = '[LSP]',
          luasnip = '[LuaSnip]',
          path = '[Path]',
        },
      }),
      fields = { 'abbr', 'kind', 'menu' },
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-e>'] = cmp.config.disable,
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'buffer' },
    },
  })
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
end

function config.auto_pairs()
  require('nvim-autopairs').setup({
    check_ts = true,
    ts_config = {
      lua = { 'string' },
      javascript = { 'template_string' },
      typescript = { 'template_string' },
      typescriptreact = { 'template_string' },
      javascriptreact = { 'template_string' },
      svelte = { 'template_string' },
    },
  })
end

function config.lspsaga()
  require('lspsaga').setup({
    rename = {
      in_select = false,
      keys = {
        quit = '<esc>',
        exec = '<CR>',
        mark = 'a',
        confirm = '<CR>',
      },
    },
    hover = {
      open_link = '<CR>',
      open_browser = '!firefox',
    },
    -- This breaks shit. Why? I can bind two keys to things like code_action quit and definition quit, but outline will give me an error. ROFL.
    -- outline = {
    --   keys = {
    --     quit = { '<esc>', 'q' },
    --   },
    -- },
    symbol_in_winbar = {
      enable = true,
      separator = ' ',
      ignore_patterns = {},
      hide_keyword = true,
      show_file = true,
      folder_level = 2,
      respect_root = false,
      color_mode = true,
    },
    ui = {
      title = false,
      border = 'rounded',
    },
    beacon = {
      enable = false,
    },
    lightbulb = {
      enable = false,
    },
  })
end

function config.mason()
  require('mason').setup()
  require('mason-tool-installer').setup({
    ensure_installed = {
      'bash-language-server',
      'black',
      'flake8',
      'pyright',
      'html-lsp',
      'json-lsp',
      'eslint-lsp',
      'lua-language-server',
      'node-debug2-adapter',
      'prettier',
      'stylua',
      'svelte-language-server',
      'tailwindcss-language-server',
      'typescript-language-server',
      'marksman',
      'markdownlint',
      'css-lsp',
      'codelldb',
      'rust-analyzer',
      'sqlls',
      'jq',
      'glow',
      'gopls',
      'golangci-lint-langserver',
      'golangci-lint',
    },
    auto_update = true,
  })
  require('mason-lspconfig').setup()
end

function config.null_ls()
  local null_ls = require('null-ls')
  null_ls.setup({
    sources = {
      -- Python formatter/linter
      null_ls.builtins.formatting.black,
      null_ls.builtins.diagnostics.flake8,
      --Lua formatter
      null_ls.builtins.formatting.stylua,
      -- TS/JS/Svelte formatter/linter
      -- null_ls.builtins.formatting.prettier.with({
      --   extra_filetypes = { 'svelte' },
      -- }),
      null_ls.builtins.formatting.dprint.with({
        filetypes = {
          'javascript',
          'javascriptreact',
          'typescript',
          'typescriptreact',
          'json',
          'markdown',
          'toml',
          'svelte',
        },
      }),
      -- Markdown
      null_ls.builtins.diagnostics.markdownlint,

      -- Postgresql
      null_ls.builtins.formatting.sqlfluff.with({
        extra_args = { '--dialect', 'postgres' }, -- change to your dialect
      }),

      null_ls.builtins.diagnostics.sqlfluff.with({
        extra_args = { '--dialect', 'postgres' }, -- change to your dialect
      }),

      -- get ts code actions
      -- require('typescript.extensions.null-ls.code-actions'),
    },
  })
end

function config.typescript_tools()
  require('typescript-tools').setup({
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
      'vue',
      'astro',
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      vim.api.nvim_create_autocmd('InsertLeave', {
        command = 'w',
        buffer = bufnr,
        nested = true,
      })
      vim.api.nvim_create_autocmd('TextChanged', {
        command = 'w',
        buffer = bufnr,
        nested = true,
      })
    end,

    settings = {
      separate_diagnostic_server = true,
      publish_diagnostic_on = 'insert_leave',
      expose_as_code_action = 'all',
      -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
      -- memory limit in megabytes or "auto"(basically no limit)
      tsserver_max_memory = 'auto',
      tsserver_locale = 'en',
      -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
      complete_function_calls = true,
      include_completions_with_insert_text = true,
      -- CodeLens
      -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
      -- possible values: ("off"|"all"|"implementations_only"|"references_only")
      code_lens = 'off',
      -- by default code lenses are displayed on all referencable values and for some of you it can
      -- be too much this option reduce count of them by removing member references from lenses
      disable_member_code_lens = true,
    },
  })
end

function config.rust_tools()
  local rt = require('rust-tools')
  local mason_path = vim.env.HOME .. '/.local/share/nvim/mason'
  local extension_path = mason_path .. '/packages/codelldb/extension'
  local codelldb_path = extension_path .. '/adapter/codelldb'
  local liblldb_path = extension_path .. '/lldb/lib/liblldb.so'
  rt.setup({
    dap = {
      adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    server = {
      standalone = true,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd('InsertLeave', {
          command = 'w',
          buffer = bufnr,
          nested = true,
        })
        vim.api.nvim_create_autocmd('TextChanged', {
          command = 'w',
          buffer = bufnr,
          nested = true,
        })
        vim.keymap.set('n', 'K', rt.hover_actions.hover_actions, { buffer = bufnr })
        vim.keymap.set('n', '<Leader>ca', rt.code_action_group.code_action_group, { buffer = bufnr })
      end,
    },
    autoSetHints = true,
  })
end

function config.actions_preview()
  require('actions-preview').setup({
    diff = {
      algorithm = 'patience',
      ignore_whitespace = true,
    },

    telescope = {
      sorting_strategy = 'ascending',
      initial_mode = 'normal',
      layout_strategy = 'vertical',
      layout_config = {
        width = 0.8,
        height = 0.9,
        prompt_position = 'top',
        preview_cutoff = 20,
        preview_height = function(_, _, max_lines)
          return max_lines - 15
        end,
      },
    },
  })
end

return config
