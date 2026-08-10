vim.o.foldmethod = 'expr'
vim.opt.foldtext = 'v:lua.vim.treesitter.foldtext()'

vim.keymap.set('n', '<localleader>e', '<cmd>Markview enable<cr>')
vim.keymap.set('n', '<localleader>d', '<cmd>Markview disable<cr>')
vim.keymap.set('n', '<localleader>t', '<cmd>Markview toggle<cr>')

-- toggle checkbox on current line
vim.keymap.set('n', '<localleader>x', function()
  local line = vim.api.nvim_get_current_line()
  if line:match '^%s*-%s%[%s%]' then
    -- unchecked -> checked
    local new_line = line:gsub('%[%s%]', '[x]', 1)
    vim.api.nvim_set_current_line(new_line)
  elseif line:match '^%s*-%s%[x%]' then
    -- checked -> unchecked
    local new_line = line:gsub('%[x%]', '[ ]', 1)
    vim.api.nvim_set_current_line(new_line)
  end
end, { buffer = true, desc = 'toggle markdown checkbox' })

-- create new checkbox and enter insert mode
vim.keymap.set('n', '<localleader>c', function()
  local line = vim.api.nvim_get_current_line()
  local indent = line:match '^%s*' or ''
  local row = vim.api.nvim_win_get_cursor(0)[1]

  -- if line is empty or only whitespace, replace it
  if line:match '^%s*$' then
    vim.api.nvim_set_current_line(indent .. '- [ ] ')
    vim.api.nvim_win_set_cursor(0, { row, #indent + 6 })
  else
    -- otherwise insert new line below
    vim.api.nvim_buf_set_lines(0, row, row, false, { indent .. '- [ ] ' })
    vim.api.nvim_win_set_cursor(0, { row + 1, #indent + 6 })
  end

  vim.cmd 'startinsert!'
end, { buffer = true, desc = 'create new checkbox' })
