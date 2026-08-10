Config.now(function()
  vim.pack.add({
    -- 'https://github.com/gbprod/nord.nvim',
    -- { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
    -- 'https://github.com/folke/tokyonight.nvim',
    -- 'https://github.com/navarasu/onedark.nvim',
    -- { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },
    'https://github.com/Shatur/neovim-ayu',
  }, { confirm = false })

  vim.cmd 'colorscheme ayu-mirage'
end)
