local M = {}
local utils = require 'scriptsync.utils'

--[[
LUALINE STUFF
]]
LuaLineTitle = "snScriptSync"
LuaLineSeparator = " > "
LuaLineMessage = ""

-- init LuaLineMessage
M.resetLuaLine = function()
  LuaLineMessage = LuaLineTitle
end

local luaLineController = function()
  return LuaLineMessage
end

M.startLuaLine = function()
  LuaLineMessage = LuaLineTitle .. LuaLineSeparator .. "Started"
  utils.set_timeout(1000, function()
    M.resetLuaLine()
  end)
end

require('lualine').setup { sections = { lualine_a = { luaLineController } } }

return M
