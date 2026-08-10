-- Tab / Indentation
vim.o.tabstop = 4
vim.o.softtabstop = 0 -- copy tabstop
vim.o.shiftwidth = 0 -- copy tabstop
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = true
vim.o.breakindent = true

-- Search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.inccommand = 'split'

-- Appearance
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.signcolumn = 'yes'
vim.o.scrolloff = 10
vim.o.showmode = false
vim.o.cursorline = true
vim.o.list = true
-- vim.o.listchars = 'trail:·,nbsp:␣,tab:  '
vim.o.listchars = 'trail:·,nbsp:␣,tab:│ '
vim.o.winborder = 'bold' -- "single" "rounded" "bold"

-- Files
vim.o.autowriteall = true
vim.o.updatetime = 500
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath 'data' .. '/undo'
vim.o.undofile = true
vim.o.sessionoptions = 'blank,buffers,curdir,folds,globals,help,localoptions,options,tabpages,winpos,winsize'

-- Behavior
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.errorbells = false
-- vim.o.shortmess = 'a'

vim.o.iskeyword = vim.o.iskeyword .. ',-'
vim.o.virtualedit = 'block'
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'

-- Completion
vim.o.completeopt = 'menuone,noselect'

-- Key timeout
vim.o.timeoutlen = 1000
vim.o.ttimeoutlen = 0

-- Folds
vim.o.foldtext = '' -- enables syntax highlighting
vim.o.foldlevel = 99

-- Diff
vim.o.diffopt = 'filler,internal,closeoff,algorithm:histogram,context:5,linematch:60'
vim.o.fillchars = vim.o.fillchars .. 'diff:╱'

-- Spell
vim.o.spelloptions = 'camel'

-- Execute .nvim.lua for project config
vim.o.exrc = true

-- Efficient macros
vim.o.lazyredraw = true
