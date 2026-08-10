Config.now(function()
  vim.pack.add({ 'https://github.com/rachartier/tiny-inline-diagnostic.nvim' }, { confirm = false })

  vim.diagnostic.config {
    underline = true,
    severity_sort = true,
    virtual_text = false,
    signs = false,
  }

  require('tiny-inline-diagnostic').setup {
    preset = 'powerline',
    options = {
      show_source = { enabled = true },
      set_arrow_to_diag_color = true,
      softwrap = 20,
      multilines = { enabled = true, always_show = true },
      show_all_diags_on_cursorline = false,
      enable_on_select = true,
      break_line = { enabled = true, after = 50 },
    },
  }
end)
