--[[
-- plugin name will be used to reload the loaded modules
--]]
local package_name = 'scriptsync'

-- add the escape character to special characters
local escape_pattern = function(text)
  return text:gsub("([^%w])", "%%%1")
end

-- unload loaded modules by the matching text
local unload_packages = function()
  local esc_package_name = escape_pattern(package_name)

  for module_name, _ in pairs(package.loaded) do
    if string.find(module_name, esc_package_name) then
      package.loaded[module_name] = nil
    end
  end
end

unload_packages()
local pack = require(package_name)

-- executes the run method in the package
local run_action = function()
  pack.run()
end
local stop_action = function()
  pack.stop()
end

-- unload and run the function from the package
function run()
  --unload_packages()
  run_action()
end

function stop()
  --unload_packages()
  stop_action()
end

function reload()
  stop_action()
  unload_packages()
end

local set_keymap = vim.api.nvim_set_keymap

set_keymap('n', ',p', '<cmd>luafile dev/init.lua<cr>', {})
set_keymap('n', ',w', '<cmd>lua run()<cr>', {})
set_keymap('n', ',o', '<cmd>lua stop()<cr>', {})
set_keymap('n', ',r', '<cmd>lua reload()<cr>', {})
vim.api.nvim_exec([[ autocmd VimLeavePre * call lua reload() ]], false)
