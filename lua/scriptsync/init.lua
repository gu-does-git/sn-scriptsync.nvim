function set_timeout(timeout, callback)
  local timer = vim.loop.new_timer()
  local function ontimeout()
    vim.loop.timer_stop(timer)
    vim.loop.close(timer)
    callback()
  end

  vim.loop.timer_start(timer, timeout, 0, ontimeout)
  return timer
end

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

require('lualine').setup { sections = { lualine_a = { luaLineController } } }

--[[
EXPORT STUFF
]]
local run = function()
  LuaLineMessage = LuaLineTitle .. LuaLineSeparator .. "Started"
  set_timeout(1000, function()
    resetLuaLine()
  end)

  -- i didn't use the copas loop
  local timer = vim.loop.new_timer()
  timer:start(0, 600, vim.schedule_wrap(function()
    copas.step()
  end))

end


--[[
EXPORT STUFF
]]
return { run = run }
