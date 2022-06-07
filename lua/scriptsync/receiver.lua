--[[
SERVER STUFF
]]
local M = {};
local parser = require 'httprequestparser'

local function get_keys(t)
  local keys = {}
  for key, _ in pairs(t) do
    table.insert(keys, key)
  end
  return keys
end

-- tcp server to receive stuff from snUtils
local function create_server(host, port, on_connect)
  local server = vim.loop.new_tcp()
  server:bind(host, port)
  server:listen(128, function(err)
    assert(not err, err) -- Check for errors.
    local sock = vim.loop.new_tcp()
    server:accept(sock) -- Accept client connection.
    on_connect(sock) -- Start reading messages.
  end)
  return server
end

M.ReceiverConnected = false;

Server = false;

M.startServer = function()
  -- Initial connection handler
  Server = create_server('0.0.0.0', 1977, function(sock)
    sock:read_start(function(err, data)
      print('ReceiverConnected')
      assert(not err, err) -- Check for errors.


      if data then
        M.ReceiverConnected = true;
        local body = parser.getRequestBodyAsString(data)
        local parsed = parser.handleJsonBody(data)

        vim.pretty_print(get_keys(parsed))
      end
    end)
  end)
end

M.stopServer = function()
  if Server or M.ReceiverConnected == true then
    M.ReceiverConnected = false;
    --Server:stop();
  end
end

return M
