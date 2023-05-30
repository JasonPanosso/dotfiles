local config = {}

function config.dap()
  require('telescope').load_extension('dap')
end

function config.dapui()
  require('dapui').setup({
    icons = { expanded = '▾', collapsed = '▸' },
    mappings = {
      open = 'o',
      remove = 'd',
      edit = 'e',
      repl = 'r',
      toggle = 't',
    },
    expand_lines = vim.fn.has('nvim-0.7'),
    layouts = {
      {
        elements = {
          'scopes',
          'watches',
        },
        size = 0.3,
        position = 'left',
      },
      {
        elements = {
          'repl',
          'breakpoints',
        },
        size = 0.3,
        position = 'bottom',
      },
    },
    floating = {
      max_height = nil,
      max_width = nil,
      border = 'single',
      mappings = {
        close = { 'q', '<Esc>' },
      },
    },
    windows = { indent = 1 },
    render = {
      max_type_length = nil,
    },
  })
end

return config
