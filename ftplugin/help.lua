vim.cmd 'normal! M'
vim.o.scrolloff = 999

vim.keymap.set('n', '<localleader>e', '<cmd>Helpview enable<cr>')
vim.keymap.set('n', '<localleader>d', '<cmd>Helpview disable<cr>')
vim.keymap.set('n', '<localleader>t', '<cmd>Helpview toggle<cr>')
