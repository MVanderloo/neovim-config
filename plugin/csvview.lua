Config.on_filetype('csv,tsv', function()
  vim.pack.add({ 'https://github.com/hat0uma/csvview.nvim' }, { confirm = false })

  require('csvview').setup {
    view = {
      min_column_width = 1,
      spacing = 1,
      display_mode = 'border',
    },
    parser = {
      comments = { '#', '//' },
    },
  }
end)
