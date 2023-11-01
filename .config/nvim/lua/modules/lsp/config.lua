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
      quit = '<esc>',
      exec = '<CR>',
      mark = 'a',
      confirm = '<CR>',
      in_select = false,
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
      null_ls.builtins.formatting.prettier.with({
        extra_filetypes = { 'svelte' },
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
      require('typescript.extensions.null-ls.code-actions'),
    },
  })
end

function config.typescript()
  require('typescript').setup({
    disable_commands = false,
    debug = false,
    go_to_source_definition = {
      fallback = true,
    },
    single_file_support = false,
    server = {
      root_dir = function(fname)
        return require('lspconfig.util').root_pattern('.git/')(fname)
          or require('lspconfig.util').root_pattern('tsconfig.json')(fname)
          or require('lspconfig.util').root_pattern('package.json', 'jsconfig.json')(fname)
      end,
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

return config
