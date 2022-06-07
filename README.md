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
- [ ] reorder the stuff to port from the extension
- [x] find a way to get the exit event and stop all the servers
  - [x] reassure that the autocmd is running on exit
- [x] create stop functions
- [x] create the receiver server module

### Stuff to port from the extension
- Receiver Server
  - [ ] Parser (redirector based on action) // line 267
  - [ ] some stuff to prevent imediate postback of saved file // line 263

- Sender Server
  - [ ] check if nvim is in a folder

- ETC
  - [ ] Array "OpenFiles" to listen for file changes
  - [ ] Functions
    - [ ] saveFieldsToServiceNow() - line 144 // 506
    - [ ] markFileAsDirty() - line 151 // 220
    - [ ] onDidChangeTextDocument() - line 159
    - [ ] saveFieldAsFile() - line 536
    - [ ] saveWidget() - line 356
    - [ ] linkAppToVSCode() - line 456
    - [ ] refreshedToken() - line 475
    - [ ] saveRequestResponse() - line 435
    - [ ] updateScriptSyncStatusBarItem() - line 629
    - [ ] requestRecords() - line 488
    - [ ] openInInstance() - line 686
    - [ ] refreshFromInstance() - line 704 (maybe an autoreload upon entering the folder?)
    - [ ] saveLog() -> new function to save all the logs to a new file if requested?
