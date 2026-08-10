Config.now(function()
  vim.pack.add({ 'https://github.com/nvim-lualine/lualine.nvim' }, { confirm = false })

  local function macro_recording()
    local reg = vim.fn.reg_recording()
    if reg == '' then return '' end
    return '@' .. reg
  end

  require('lualine').setup {
    refresh = { statusline = 1, tabline = 10, winbar = 10 },
    options = {
      theme = 'auto',
      component_separators = { left = '|', right = '|' },
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { 'mode', 'selectioncount', macro_recording },
      lualine_b = {
        { 'filename', path = 4 },
      },
      lualine_c = { 'diff' },
      lualine_x = {
        'searchcount',
        {
          'diagnostics',
          symbols = { error = '󰅙 ', warn = '󰀦 ', info = '󰋼 ', hint = '󰌵 ' },
        },
      },
      lualine_y = { 'progress', 'filesize' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    inactive_winbar = {},
    extensions = { 'oil', 'quickfix' },
  }
end)
