-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}} pa+=./lua:
--
-- init.lua by Andy3153
-- created   02/06/22 ~ 19:24:15
-- modified  28/06/22 ~ 12:14:12
--
-- Files included here are inside the `lua` folder,
-- `gf` on any file in the list to open it in Nvim
--

-- Enable lightweight mode with plugins disabled
lightweightMode = false

require('vars')      -- Variables & shortened functions
require('opts')      -- Options
require('keybinds')  -- Keymaps
require('autocmds')  -- Autocommands
require('functions') -- Custom Lua functions
require('vimscript') -- Things still in Vimscript
require('plugins')   -- packer.nvim configs
