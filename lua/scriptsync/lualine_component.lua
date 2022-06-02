local utils = require 'scriptsync.utils'

--[[
LUALINE STUFF
]]
LuaLineTitle = "snScriptSync"
LuaLineSeparator = " > "
LuaLineMessage = ""

-- init LuaLineMessage
function resetLuaLine()
  LuaLineMessage = LuaLineTitle
end

local function luaLineController()
  return LuaLineMessage
end

function startLuaLine()
  LuaLineMessage = LuaLineTitle .. LuaLineSeparator .. "Started"
  utils.set_timeout(1000, function()
    resetLuaLine()
  end)
end

require('lualine').setup { sections = { lualine_a = { luaLineController } } }

return {
  resetLuaLine = resetLuaLine,
  startLuaLine = startLuaLine
}
