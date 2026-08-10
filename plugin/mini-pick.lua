Config.later(function()
  require('mini.pick').setup()
  vim.ui.select = function(items, opts, on_choice)
    local start_opts = { window = { config = { width = vim.o.columns } } }
    return require('mini.pick').ui_select(items, opts, on_choice, start_opts)
  end

  vim.keymap.set({ 'n', 'x' }, '<leader>f', '<cmd>Pick files<cr>', { noremap = true, silent = true })
  vim.keymap.set({ 'n', 'x' }, '<leader>g', '<cmd>Pick grep_live<cr>', { noremap = true, silent = true })
  vim.keymap.set({ 'n', 'x' }, '<leader>,', '<cmd>Pick buffers<cr>', { noremap = true, silent = true })
  vim.keymap.set({ 'n', 'x' }, '<leader>.', '<cmd>Pick resume<cr>', { noremap = true, silent = true })
end)
