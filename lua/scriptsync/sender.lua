--[[
SERVER STUFF
]]
local M = {}
local copas = require 'copas'

-- Initial connection handler

local initial_handler = function(ws)
  WS = ws
  if M.SenderConnected == false then
    ws:send('["Connected to NVIM ScriptSync WebSocket"]')
    M.SenderConnected = true;
    LuaLineMessage = LuaLineTitle .. LuaLineSeparator .. "Connected"
  end
end

-- wss:// server to send stuff to snUtils
M.startServer = function()
  ServerSender = require 'websocket'.server.copas.listen
  {
    port = 1978,
    protocols = {
      echo = initial_handler
    },
    default = initial_handler
  }
  M.SenderConnected = false;

  local timer = vim.loop.new_timer()
  timer:start(0, 600, vim.schedule_wrap(function()
    copas.step()
  end))
end

M.stopServer = function()
  M.SenderConnected = false;
  WS.sock_close()
  ServerSender:close(WS)
end

return M
