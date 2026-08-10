vim.pack.add({ 'https://github.com/a7lavinraj/fyler.nvim' }, { confirm = false })

require('fyler').setup {
  auto_confirm_simple_mutation = true,
  use_as_default_explorer = false,
  win_opts = { cursorline = true },
  kind_presets = {
    replace = {
      mappings = {
        n = {
          ['<CR>'] = {
            action = 'select',
            args = { close = false },
          },
        },
      },
    },
  },
}

vim.keymap.set(
  'n',
  '<leader>e',
  function() require('fyler').toggle { kind = 'split_left_most' } end,
  { desc = 'Toggle File Tree' }
)
