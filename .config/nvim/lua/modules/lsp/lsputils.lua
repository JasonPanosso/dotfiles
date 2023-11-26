local M = {}

local project_file_names = { 'default', 'dev', 'test', 'bundle' }

function M.locate_config(names)
  return vim.fs.find(names, {
    path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
    stop = vim.loop.os_homedir(),
    upward = true,
  })
end

function M.get_rojo_projects()
  for index, name in ipairs(project_file_names) do
    project_file_names[index] = name .. '.project.json'
  end

  return M.locate_config(project_file_names)
end

function M.dir_is_luau()
  local rojo_project_files = M.get_rojo_projects()

  for _, v in pairs(rojo_project_files) do
    if v ~= nil then
      return true
    end
  end

  return false
end

return M
