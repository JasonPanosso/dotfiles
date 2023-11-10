local config = {}

function config.rest()
  require('rest-nvim').setup({
    result_split_horizontal = false,
    result_split_in_place = false,
    skip_ssl_verification = false,
    encode_url = true,
    highlight = {
      enabled = true,
      timeout = 150,
    },
    result = {
      show_url = true,
      show_curl_command = false,
      show_http_info = true,
      show_headers = true,
      formatters = {
        json = 'jq',
        html = function(body)
          return vim.fn.system({ 'tidy', '-i', '-q', '-' }, body)
        end,
      },
    },
    jump_to_request = false,
    env_file = '.env',
    custom_dynamic_variables = {},
    yank_dry_run = true,
  })
end

function config.harpoon()
  vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
  vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
  vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
  vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
  vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')
  require('harpoon').setup({
    global_settings = {
      mark_branch = true,
      tabline = true,
      tabline_prefix = ' ',
      tabline_suffix = ' ',
    },
    mark_branch = true,
    tabline = true,
    tabline_prefix = ' ',
    tabline_suffix = ' ',
  })
end

function config.neotest()
  -- setup namespace, and do jank to make error messages neater
  local neotest_ns = vim.api.nvim_create_namespace('neotest')
  vim.diagnostic.config({
    virtual_text = {
      format = function(diagnostic)
        local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
        return message
      end,
    },
  }, neotest_ns)

  require('neotest').setup({
    adapters = {
      require('neotest-vitest'),
      require('neotest-rust'),
      require('neotest-playwright').adapter({
        options = {
          persist_project_selection = true,
          enable_dynamic_test_discovery = true,
        },
      }),
      require('neotest-go'),
    },
  })
end

return config
