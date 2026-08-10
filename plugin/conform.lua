Config.later(function()
  vim.pack.add({ 'https://github.com/stevearc/conform.nvim' }, { confirm = false })

  require('conform').setup {
    notify_on_error = true,
    default_format_opts = { lsp_format = 'fallback' },
    formatters_by_ft = {
      awk = { 'gawk' },
      bash = { 'shfmt' },
      c = { 'clang-format' },
      dockerfile = { 'dockerfmt' },
      fish = { 'fish_indent' },
      javascript = { 'prettier' },
      json = { 'prettier' },
      jsonc = { 'prettier' },
      json5 = { 'prettier' },
      justfile = { 'just' },
      go = { 'goimports', 'gofmt' },
      less = { 'prettier' },
      lua = { 'stylua' },
      markdown = { 'prettier' },
      nix = { 'nixfmt' },
      python = { 'ruff_format', 'ruff_fix' },
      roc = { 'roc' },
      rust = { 'rustfmt' },
      scss = { 'prettier' },
      sql = { 'trim_whitespace' },
      sh = { 'shfmt' },
      toml = { 'taplo' },
      typst = { 'typst' },
      yaml = { 'yamlfix' },
      zig = { 'zigfmt' },
      zsh = { 'shfmt' },
      ['_'] = { 'trim_whitespace', 'trim_newlines' },
    },
  }

  vim.o.formatexpr = "v:lua.require('conform').formatexpr()"

  vim.keymap.set({ 'n' }, 'glf', function() require('conform').format { async = true } end, { desc = 'Format Code' })

  vim.keymap.set({ 'x' }, 'glf', function()
    require('conform').format({ async = true }, function(err)
      if not err then
        local mode = vim.api.nvim_get_mode().mode
        if vim.startswith(string.lower(mode), 'v') then
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)
        end
      end
    end)
  end, { desc = 'Format code' })
end)
