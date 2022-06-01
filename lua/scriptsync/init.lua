local copas = require'copas'

-- this callback is called, whenever a new client connects.
-- ws is a new websocket instance
local echo_handler = function(ws)
		print('received a new client')
		ws:send('["SIUUUUUU É O LUVA DE CODEIRO MELHOR DO BRASIL"]') -- TODO: change this into a better message XD
end

-- create a copas webserver and start listening
local server = require'websocket'.server.copas.listen
{
  -- listen on port 8080
  port = 1978,
  -- the protocols field holds
  --   key: protocol name
  --   value: callback on new connection
  protocols = {
    -- this callback is called, whenever a new client connects.
    -- ws is a new websocket instance
    echo = echo_handler
  },
  default = echo_handler
}

-- use the copas loop
copas.loop()