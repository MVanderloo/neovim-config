-- to optimize startup we can delay loading unless there is a directory as an argument
vim.pack.add({ 'https://github.com/stevearc/oil.nvim' }, { confirm = false })

require('oil').setup {
  default_file_explorer = true,
  watch_for_changes = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, bufnr) return name == '..' end,
  },
}

vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' })
