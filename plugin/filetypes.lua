vim.filetype.add {
  pattern = {
    ['.*/%.?git/ignore'] = 'gitignore',
    ['.*/%.?git/config'] = 'gitconfig',
  },
  extension = {
    gp = 'gnuplot',
  },
}
