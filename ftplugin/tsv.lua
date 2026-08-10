vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = false

vim.keymap.set('n', '<localleader>e', '<cmd>CsvViewEnable<cr>')
vim.keymap.set('n', '<localleader>d', '<cmd>CsvViewDisable<cr>')
vim.keymap.set('n', '<localleader>t', '<cmd>CsvViewToggle<cr>')
