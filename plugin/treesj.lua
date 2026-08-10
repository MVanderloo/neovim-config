Config.later(function()
  vim.pack.add({ 'https://github.com/wansmer/treesj' }, { confirm = false })

  require('treesj').setup { use_default_keymaps = false, max_join_length = 1000 }

  vim.keymap.set('n', 'glj', require('treesj').join, { desc = 'Join Tree-sitter Nodes' })
  vim.keymap.set('n', 'gls', require('treesj').split, { desc = 'Split Tree-sitter Nodes' })
  -- vim.keymap.set('n', 'glt', require('treesj').toggle, { desc = 'Toggle Split/Join' })
end)
