Config.later(function()
  vim.pack.add({ 'https://github.com/sunnytamang/select-undo.nvim' }, { confirm = false })

  require('select-undo').setup {
    keymaps = {
      ['<cr>'] = 'accept',
      ['<esc>'] = 'cancel',
      ['n'] = 'next',
      ['N'] = 'previous',
    },
  }
end)
