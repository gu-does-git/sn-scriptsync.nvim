# sn-scriptsync.nvim

## How is built
- [lua-websockets](https://github.com/lipp/lua-websockets)
- [lua 5.1.5](https://www.lua.org/versions.html#5.1)
- [luarocks](https://github.com/luarocks/luarocks)
- [httprequestparser](https://luarocks.org/modules/yogiverma1991/httprequestparser)


## How to do async
- [timer background](https://stackoverflow.com/questions/68598026/running-async-lua-function-in-neovim)

## Todo
- [] [find the temp folder: dir=~/tmp](https://neovim.io/doc/user/recover.html)
- [] [create module/functions to import files and create them in the temp folder](https://neovim.io/doc/user/editing.html)
- [] find a way to get the exit event and stop all the servers
- [] create stop functions
- [x] create the receiver server module
