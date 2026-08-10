vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
}, { confirm = false })

require('nvim-treesitter-textobjects').setup {
  select = {
    lookahead = true,
  },
  move = { set_jumps = true },
}
-- local ts_move = require 'nvim-treesitter-textobjects.move'
-- local ts_repeat_move = require 'nvim-treesitter-textobjects.repeatable_move'

-- mini.bracketed file movement
-- vim.keymap.set({ 'n', 'x', 'o' }, ']f', function() ts_move.goto_next_start('@function.outer', 'textobjects') end)
-- vim.keymap.set({ 'n', 'x', 'o' }, '[f', function() ts_move.goto_previous_start('@function.outer', 'textobjects') end)

-- I just don't use this
-- vim.keymap.set({ 'n', 'x', 'o' }, ']C', function() ts_move.goto_next_start('@class.outer', 'textobjects') end)
-- vim.keymap.set({ 'n', 'x', 'o' }, '[C', function() ts_move.goto_previous_start('@class.outer', 'textobjects') end)

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
-- vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
-- vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
-- vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
-- vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
-- vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
-- vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })

-- local ts_gen_spec = require('mini.ai').gen_spec.treesitter
-- require('mini.ai').setup {
--   custom_textobjects = {
--     f = ts_gen_spec { a = '@function.outer', i = '@function.inner' },
--     C = ts_gen_spec { a = '@class.outer', i = '@class.inner' },
--     b = ts_gen_spec { a = '@block.outer', i = '@block.inner' },
--     l = ts_gen_spec { a = '@loop.outer', i = '@loop.inner' },
--     c = ts_gen_spec { a = '@comment.outer', i = '@comment.inner' },
--     o = ts_gen_spec { a = '@condition.outer', i = '@condition.inner' },
--   },
--   n_lines = 100,
-- }

-- Enable treesitter features and auto-install parsers
vim.api.nvim_create_autocmd('FileType', {
  group = Config.my_augroup,
  desc = 'Enable treesitter',
  callback = function(args)
    local treesitter = require 'nvim-treesitter'
    local lang = vim.treesitter.language.get_lang(args.match)

    if not vim.list_contains(treesitter.get_available(), lang) then return end

    local function enable(buf)
      if not vim.api.nvim_buf_is_valid(buf) then return end
      vim.treesitter.start(buf)
      vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.wo[vim.fn.bufwinid(buf)].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo[vim.fn.bufwinid(buf)].foldmethod = 'expr'
    end

    if vim.list_contains(treesitter.get_installed(), lang) then
      enable(args.buf)
    else
      -- async install, non-blocking; enable treesitter once it's ready
      treesitter.install(lang):await(function(err)
        if not err then enable(args.buf) end
      end)
    end
  end,
})
