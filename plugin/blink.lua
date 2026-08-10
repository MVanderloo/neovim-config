Config.now(function()
  vim.pack.add({
    { src = 'https://github.com/saghen/blink.cmp', version = 'v1.10.2' },
    'https://github.com/xzbdmw/colorful-menu.nvim',
    'https://github.com/mikavilpas/blink-ripgrep.nvim',
    'https://github.com/rafamadriz/friendly-snippets',
  }, { confirm = false })

  vim.lsp.config('*', { capabilities = require('blink.cmp').get_lsp_capabilities() })

  require('blink.cmp').setup {
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
      },
      menu = {
        auto_show = function(ctx) return ctx.mode ~= 'cmdline' end,
      },
      list = { selection = { preselect = false, auto_insert = false } },
    },
    keymap = {
      preset = 'none',
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },

      ['<C-y>'] = { 'select_and_accept', 'fallback' },
      -- ['<CR>'] = { 'accept', 'fallback' },

      ['<Tab>'] = {
        'snippet_forward',
        'select_and_accept',
        'fallback',
      },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

      ['<C-p>'] = { 'insert_prev', 'fallback_to_mappings' },
      ['<C-n>'] = { 'insert_next', 'fallback_to_mappings' },

      ['<Up>'] = { 'scroll_documentation_up', 'fallback' },
      ['<Down>'] = { 'scroll_documentation_down', 'fallback' },

      ['<BS>'] = {
        function(cmp)
          if not cmp.cancel() then return false end
        end,
        'fallback',
      },

      ['<C-s>'] = { function(cmp) cmp.show { providers = { 'snippets' } } end },
    },

    sources = {
      default = { 'lsp', 'path', 'buffer', 'ripgrep' },
      providers = {
        ripgrep = {
          module = 'blink-ripgrep',
          name = 'Ripgrep',
          opts = { prefix_min_len = 5 },
        },
      },
    },
    appearance = { use_nvim_cmp_as_default = false, nerd_font_variant = 'mono' },
    signature = { enabled = true },
  }
end)
