Config.later(function()
  vim.pack.add({ 'https://github.com/stevearc/quicker.nvim' }, { confirm = false })

  local quicker = require 'quicker'

  quicker.setup {
    keys = {
      {
        '>',
        function() quicker.expand { before = 2, after = 2, add_to_existing = true } end,
        desc = 'Expand quickfix context',
      },
      {
        '<',
        function() quicker.collapse() end,
        desc = 'Collapse quickfix context',
      },
    },
  }

  vim.keymap.set('n', '<leader>q', function()
    quicker.toggle()
    quicker.close { loclist = true }
  end, { desc = 'Toggle quickfix' })

  vim.keymap.set('n', '<leader>l', function()
    quicker.toggle { loclist = true }
    if quicker.is_open(0) then quicker.close() end
  end, { desc = 'Toggle loclist' })

  vim.keymap.set('n', '<C-q>', function()
    vim.diagnostic.setqflist()
    quicker.close { loclist = true }
    quicker.open()
  end)

  vim.keymap.set('n', '<C-l>', function()
    vim.diagnostic.setloclist {}
    quicker.close()
    quicker.open { loclist = true }
  end)
end)
