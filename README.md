# [WIP] sn-scriptsync.nvim

## How is built
- [lua-websockets](https://github.com/lipp/lua-websockets)
- [lua v5.1.5](https://www.lua.org/versions.html#5.1)
- [luarocks](https://github.com/luarocks/luarocks)
- [httprequestparser](https://luarocks.org/modules/yogiverma1991/httprequestparser)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)


## How to do async
- [timer background](https://stackoverflow.com/questions/68598026/running-async-lua-function-in-neovim)

## Todo
- [x] improve the lualine module (substituted by nvim-notify)
- [ ] [create a lualine module with the status](https://github.com/nvim-lualine/lualine.nvim/wiki/Plugins)
- [ ] [find the temp folder: dir=~/tmp](https://neovim.io/doc/user/recover.html)
- [ ] [create module/functions to import files and create them in the temp folder](https://neovim.io/doc/user/editing.html)
- [x] find a way to get the exit event and stop all the servers
  - [ ] reassure that the autocmd is running on exit
- [x] create stop functions
- [x] create the receiver server module
