Config.later(function()
  require('mini.bracketed').setup {
    buffer = { suffix = 'b', options = {} },
    comment = { suffix = '', options = {} },
    conflict = { suffix = 'x', options = {} },
    diagnostic = { suffix = '', options = {} },
    file = { suffix = 'f', options = {} },
    indent = { suffix = 'i', options = {} },
    jump = { suffix = 'j', options = {} },
    location = { suffix = 'l', options = {} },
    oldfile = { suffix = '', options = {} },
    quickfix = { suffix = 'q', options = {} },
    treesitter = { suffix = '', options = {} },
    undo = { suffix = 'u', options = {} },
    window = { suffix = 'w', options = {} },
    yank = { suffix = 'y', options = {} },
  }
end)
