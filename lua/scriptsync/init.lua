local sender = require 'scriptsync.sender'
local receiver = require 'scriptsync.receiver'
local utils = require 'scriptsync.utils'

--[[
EXPORT STUFF
]]
local run = function()
  utils.sendNoti("Starting servers", "info")
  sender.startServer()
  receiver.startServer()
end

local stop = function()
  utils.sendNoti("Stopping servers", "info")
  sender.stopServer()
  receiver.stopServer()
end


--[[
EXPORT STUFF
]]
return { run = run, stop = stop }
