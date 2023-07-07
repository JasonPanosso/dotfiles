local config = {}

function config.neogit()
  require('neogit').setup({
    disable_signs = false,
    disable_hint = false,
    disable_context_highlighting = false,
    disable_commit_confirmation = false,
    -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
    -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
    auto_refresh = true,
    disable_builtin_notifications = false,
    use_magit_keybindings = false,
    -- Change the default way of opening neogit
    kind = 'tab',
    -- The time after which an output console is shown for slow running commands
    console_timeout = 2000,
    -- Automatically show console if a command takes more than console_timeout milliseconds
    auto_show_console = true,
    -- Change the default way of opening the commit popup
    commit_popup = {
      kind = 'split',
    },
    -- Change the default way of opening the preview buffer
    preview_buffer = {
      kind = 'split',
    },
    -- Change the default way of opening popups
    popup = {
      kind = 'split',
    },
    -- customize displayed signs
    signs = {
      -- { CLOSED, OPENED }
      section = { '>', 'v' },
      item = { '>', 'v' },
      hunk = { '', '' },
    },
    integrations = {
      diffview = true,
    },
    -- override/add mappings
    mappings = {
      -- modify status buffer mappings
      status = {
        -- Adds a mapping with "B" as key that does the "BranchPopup" command
        ['B'] = 'BranchPopup',
        -- Removes the default mapping of "s"
        ['s'] = '',
      },
    },
  })
end

function config.diffview()
  require('diffview').setup()
end

function config.comment()
  require('nvim-treesitter.configs').setup({
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })
  require('Comment').setup({
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  })
end
return config
