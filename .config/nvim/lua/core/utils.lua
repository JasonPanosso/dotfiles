local M = {}

-- improve gx
M.gx = function()
  local url = vim.fn.expand('<cWORD>')
  local escaped_url = vim.fn.shellescape(url, true)
  os.execute(string.format('xdg-open %s >/dev/null 2>&1', escaped_url))
end

M.getVisualModeSelection = function()
  local vstart = vim.fn.getpos("'<")
  local vend = vim.fn.getpos("'>")
  M.table_print(vstart)
  M.table_print(vend)

  local line_start = vstart[2]
  local line_end = vend[2]

  local lines = vim.fn.getline(line_start, line_end)

  local selection = table.concat(lines, '\n'):gsub('[\n\r]', '')
  return selection
end

M.tablePrint = function(tbl, indent)
  if not indent then
    indent = 0
  end

  for k, v in pairs(tbl) do
    local formatting = string.rep('  ', indent) .. k .. ': '
    if type(v) == 'table' then
      print(formatting)
      M.tablePrint(v, indent + 1)
    elseif type(v) == 'boolean' then
      print(formatting .. tostring(v))
    else
      print(formatting .. v)
    end
  end
end

return M
