--[[
SERVER STUFF
]]
local copas = require 'copas'

-- Initial connection handler
local initial_handler = function(ws)
  SenderConnected = true;
  LuaLineMessage = LuaLineTitle .. LuaLineSeparator .. "Connected"
  ws:send('["Connected to NVIM ScriptSync WebSocket"]')
end

-- wss:// server to send stuff to snUtils
local serverSender = require 'websocket'.server.copas.listen
{
  port = 1978,
  protocols = {
    echo = initial_handler
  },
  default = initial_handler
}
SenderConnected = false;

function startServer()
  -- i didn't use the copas loop
  local timer = vim.loop.new_timer()
  timer:start(0, 600, vim.schedule_wrap(function()
    copas.step()
  end))
end

return {
  senderConnected = SenderConnected,
  startServer = startServer
}
