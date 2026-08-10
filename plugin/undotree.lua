Config.later(function()
  vim.cmd 'packadd nvim.undotree'

  vim.keymap.set('n', '<leader>u', function()
    if not require('undotree').open {
      title = 'undotree',
      command = 'topleft 40vnew',
    } then
      vim.bo.filetype = 'undotree'
    end
  end)
end)
