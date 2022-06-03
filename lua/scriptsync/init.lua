local sender = require 'scriptsync.sender'
local receiver = require 'scriptsync.receiver'
local lualine = require 'scriptsync.lualine_component'

--[[
EXPORT STUFF
]]
local run = function()
  lualine.startLuaLine()
  sender.startServer()
  receiver.startServer()
end

local stop = function()
  sender.stopServer()
  receiver.stopServer()
  lualine.resetLuaLine()
end


--[[
EXPORT STUFF
]]
return { run = run, stop = stop }
