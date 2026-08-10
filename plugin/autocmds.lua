-- check if file has changed when regaining focus
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  command = 'checktime',
  group = Config.my_augroup,
})

-- save on buffer switch
vim.api.nvim_create_autocmd('BufLeave', {
  callback = function()
    if vim.bo.modified and not vim.bo.readonly and vim.fn.expand '%' ~= '' and vim.bo.buftype == '' then
      vim.cmd.update { bang = true }
    end
  end,
  group = Config.my_augroup,
})

-- save all modified buffers on focus loss
vim.api.nvim_create_autocmd('FocusLost', {
  callback = function() vim.cmd.wall { mods = { silent = true, emsg_silent = true } } end,
  group = Config.my_augroup,
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  callback = function() vim.hl.on_yank() end,
  group = Config.my_augroup,
})

-- create all intermediate directories along path when saving a file
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(event)
    if event.match:match '^%w%w+:[\\/][\\/]' then return end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
  group = Config.my_augroup,
})

-- start terminal in insert mode
vim.api.nvim_create_autocmd('TermOpen', {
  command = 'startinsert | set winfixheight',
})

-- root detection
vim.api.nvim_create_autocmd('BufEnter', {
  nested = true,
  callback = function(data)
    local names = { '.git' }

    local path = vim.api.nvim_buf_get_name(data.buf)

    if path == '' then return end

    local root_file = vim.fs.find(names, { path = vim.fs.dirname(path), upward = true })[1]
    if root_file ~= nil then
      local root = vim.fs.dirname(root_file)
      if root ~= nil then vim.fn.chdir(root) end
    end
  end,
  group = Config.my_augroup,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Close with <q>',
  pattern = { 'git', 'help', 'man', 'qf', 'query', 'scratch' },
  callback = function(args) vim.keymap.set('n', 'q', '<cmd>quit<cr>', { buffer = args.buf }) end,
  group = Config.my_augroup,
})

vim.api.nvim_create_autocmd({ 'BufDelete', 'BufWipeout' }, {
  desc = 'Write to ShaDa when deleting/wiping out buffers',
  command = 'wshada',
  group = Config.my_augroup,
})

-- Install tree-sitter parser
-- vim.api.nvim_create_autocmd('FileType', {
--   callback = function(event)
--     local lang = vim.treesitter.language.get_lang(event.match)
--     if not lang then return end
--     local ok = pcall(vim.treesitter.start, event.buf, lang)
--     if not ok then
--       local parsers = require 'nvim-treesitter.parsers'
--       if not parsers[lang] then return end
--       require('nvim-treesitter').install { lang }
--       vim.notify('Installing tree-sitter parser for ' .. lang, vim.log.levels.INFO)
--     end
--   end,
-- })

-- -- Auto resize
-- vim.api.nvim_create_autocmd('VimResized', {
--   callback = function() vim.cmd.wincmd '=' end,
--   group = Config.my_augroup,
-- })

-- This is already handled with sessions
-- -- Restore cursor, folds, etc.
vim.api.nvim_create_autocmd('BufWinLeave', {
  callback = function() vim.cmd 'silent! mkview' end,
  group = Config.my_augroup,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function() vim.cmd 'silent! loadview' end,
  group = Config.my_augroup,
})

-- Automatic sessions
-- local session_dir = vim.fn.stdpath 'data' .. '/sessions'
-- vim.fn.mkdir(session_dir, 'p')
--
-- local function session_path() return session_dir .. '/' .. vim.fn.getcwd():gsub('/', '%%') .. '.vim' end
-- -- local function session_path() return vim.fn.getcwd() .. '/Session.vim' end
--
-- vim.api.nvim_create_autocmd('VimLeavePre', {
--   desc = 'Save session',
--   callback = function() vim.cmd('mksession! ' .. vim.fn.fnameescape(session_path())) end,
--   group = Config.my_augroup,
-- })

-- vim.api.nvim_create_autocmd('VimEnter', {
--   desc = 'Restore session',
--   nested = true,
--   callback = function()
--     if vim.fn.argc() == 0 then
--       local path = session_path()
--       if vim.fn.filereadable(path) == 1 then vim.cmd('silent source ' .. vim.fn.fnameescape(path)) end
--     end
--   end,
--   group = Config.my_augroup,
-- })

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '.nvim.lua',
  callback = function(ev) vim.secure.trust { action = 'allow', path = vim.api.nvim_buf_get_name(ev.buf) } end,
  group = Config.my_augroup,
})
