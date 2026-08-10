-- Set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Setup global Config table with useful things
_G.Config = {}

-- Load mini.nvim to use mini.misc
vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' }, { confirm = false })
local misc = require 'mini.misc'

-- Execute immediately. For what must be executed during startup, like UI elements.
Config.now = function(f) misc.safely('now', f) end

-- Execute a bit later. Use for things not needed during startup.
Config.later = function(f) misc.safely('later', f) end

-- Use only if needed during startup when Neovim is started like
-- `nvim -- path/to/file`, but otherwise delaying is fine.
Config.now_if_args = vim.fn.argc(-1) > 0 and Config.now or Config.later

-- Execute once on a first matched event.
-- e.x. `on_event('InsertEnter', function() ... end)`
Config.on_event = function(ev, f) misc.safely('event:' .. ev, f) end

-- Execute once on a first matched filetype. Like "delay until first Lua file"
-- e.x. `on_filetype('lua', function() ... end)`
Config.on_filetype = function(ft, f) misc.safely('filetype:' .. ft, f) end

-- Augroup for all my autocmds
Config.my_augroup = vim.api.nvim_create_augroup('my-autocmds', {})
