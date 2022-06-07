--[[
SERVER STUFF
]]
local M = { serverHasBeenAdded = false, SenderConnected = false, AsyncTimer = nil, WS = nil }
local copas = require 'copas'
local utils = require 'scriptsync.utils'

-- Initial conection handler
local initial_handler = function(ws)
  M.WS = ws
  if M.SenderConnected == false then
    M.SenderConnected = true;
    ws:send('["Connected to NVIM ScriptSync WebSocket!"]')
    utils.sendNoti("Connected to SNUtils!", "info")
  end
end

-- wss:// server to send stuff to snUtils
M.startServer = function()
  -- if to add the server only once
  if M.serverHasBeenAdded == false then
    ServerSender = require 'websocket'.server.copas.listen
    {
      port = 1978,
      protocols = {
        echo = initial_handler
      },
      default = initial_handler
    }
    M.serverHasBeenAdded = true;
  end

  -- loop to run a conection
  M.AsyncTimer = vim.loop.new_timer()
  M.AsyncTimer:start(0, 100, vim.schedule_wrap(function()
    print('connecting...')
    copas.step()
  end))
end

M.stopServer = function()
  -- stop timer
  if M.AsyncTimer ~= nil then
    print(' connection closed ')
    M.AsyncTimer:close()
    M.AsyncTimer = nil
  end

  -- remove connected clients
  if M.WS ~= nil then
    M.SenderConnected = false;
    M.WS.sock_close()
    ServerSender:close(M.WS)
    M.WS = nil;
  end
end

return M
