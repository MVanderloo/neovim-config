Config.later(function()
  vim.api.nvim_create_user_command('Diff', function(opts)
    if vim.tbl_count(opts.fargs) ~= 2 then
      vim.notify('Diff requires exactly two directory arguments', vim.log.levels.ERROR)
      return
    end

    vim.cmd 'tabnew'
    vim.cmd.packadd 'nvim.difftool'
    require('difftool').open(opts.fargs[1], opts.fargs[2], {
      rename = { detect = true },
      ignore = { '.git' },
      method = 'auto',
    })
  end, { complete = 'dir', nargs = '*' })
end)
