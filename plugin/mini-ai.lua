Config.later(function()
  local ts_gen_spec = require('mini.ai').gen_spec.treesitter
  require('mini.ai').setup {
    custom_textobjects = {
      f = ts_gen_spec { a = '@function.outer', i = '@function.inner' },
      t = ts_gen_spec { a = '@class.outer', i = '@class.inner' },
      b = ts_gen_spec { a = '@block.outer', i = '@block.inner' },
      l = ts_gen_spec { a = '@loop.outer', i = '@loop.inner' },
      c = ts_gen_spec { a = '@comment.outer', i = '@comment.inner' },
      o = ts_gen_spec { a = '@condition.outer', i = '@condition.inner' },
    },
    n_lines = 100,
  }
end)
