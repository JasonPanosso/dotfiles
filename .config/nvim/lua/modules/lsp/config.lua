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
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

function config.auto_pairs()
  require('nvim-autopairs').setup({
    check_ts = true,
    ts_config = {
      lua = { 'string' },
      luau = { 'string' },
      javascript = { 'template_string' },
      typescript = { 'template_string' },
      typescriptreact = { 'template_string' },
      javascriptreact = { 'template_string' },
      svelte = { 'template_string' },
    },
    enable_check_bracket_line = true, -- ?,
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
      'codelldb',
      'black',
      'flake8',
      'pyright',
      'html-lsp',
      'json-lsp',
      'eslint-lsp',
      'lua-language-server',
      'luau_lsp',
      'node-debug2-adapter',
      'prettier',
      'prettierd',
      'stylua',
      'svelte-language-server',
      'tailwindcss-language-server',
      'typescript-language-server',
      'marksman',
      'markdownlint',
      'css-lsp',
      'codelldb',
      'rust-analyzer',
      'jq',
      'glow',
      'gopls',
      'golangci-lint',
      'golangci-lint-langserver',
      'beautysh',
      'sqlfluff',
      'dprint',
      'selene',
      'taplo',
    },
    auto_update = true,
  })

  require('mason-lspconfig').setup()
end

function config.lint()
  local sqlfluff = require('lint').linters.sqlfluff

  sqlfluff.args = {
    'lint',
    '--format=json',
    '--dialect=postgres',
  }

  require('lint').linters_by_ft = {
    markdown = { 'markdownlint' },
    python = { 'flake8' },
    lua = { 'selene' },
    luau = { 'selene' },
    sql = { 'sqlfluff' },
  }

  vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged', 'BufRead' }, {
    callback = function()
      require('lint').try_lint()
    end,
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
      'svelte',
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
    -- handlers = {
    --   ['textDocument/publishDiagnostics'] = function(_, result, ctx, conf)
    --     if result.diagnostics == nil then
    --       return
    --     end
    --
    --     local idx = 1
    --     while idx <= #result.diagnostics do
    --       local entry = result.diagnostics[idx]
    --
    --       local formatter = require('modules.lsp.test')[entry.code]
    --       entry.message = formatter and formatter(entry.message) or entry.message
    --
    --       idx = idx + 1
    --     end
    --
    --     vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, conf)
    --   end,
    -- },

    settings = {
      separate_diagnostic_server = true,
      publish_diagnostic_on = 'insert_leave',
      expose_as_code_action = 'all',
      tsserver_max_memory = 'auto',
      tsserver_locale = 'en',
      complete_function_calls = true,
      include_completions_with_insert_text = true,
      code_lens = 'off',
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
      -- standalone = true,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      on_attach = function(_, bufnr)
        vim.keymap.set('n', 'K', rt.hover_actions.hover_actions, { buffer = bufnr })
        vim.keymap.set('n', '<Leader>ca', rt.code_action_group.code_action_group, { buffer = bufnr })
      end,
    },
    -- autoSetHints = true,
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
