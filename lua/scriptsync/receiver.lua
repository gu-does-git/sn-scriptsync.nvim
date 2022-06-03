--[[
SERVER STUFF
]]
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

ReceiverConnected = false;

function startServer()
  -- Initial connection handler
  local server = create_server('0.0.0.0', 1977, function(sock)
    sock:read_start(function(err, data)
      print('ReceiverConnected')
      assert(not err, err) -- Check for errors.


      if data then
        ReceiverConnected = true;
        local body = parser.getRequestBodyAsString(data)
        local parsed = parser.handleJsonBody(data)

        vim.pretty_print(get_keys(parsed))
      end
    end)
  end)
end

return {
  receiverConnected = ReceiverConnected,
  startServer = startServer
}
