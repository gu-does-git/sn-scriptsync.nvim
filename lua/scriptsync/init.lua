local sender = require 'scriptsync.sender'
local lualine = require 'scriptsync.lualine_component'

--[[
EXPORT STUFF
]]
local run = function()
  lualine.startLuaLine()
  sender.startServer()
end


--[[
EXPORT STUFF
]]
return { run = run }
