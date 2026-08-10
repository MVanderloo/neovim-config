Config.now(function()
  -- Set up folding with LSP -> Treesitter -> indent fallback
  vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'Setup LSP folding if available',
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client:supports_method('textDocument/foldingRange') then
        vim.api.nvim_set_option_value('foldmethod', 'expr', { win = 0 })
        vim.api.nvim_set_option_value('foldexpr', 'v:lua.vim.lsp.foldexpr()', { win = 0 })
      end
    end,
  })

  -- For buffers without LSP, try treesitter, then fall back to indent
  vim.api.nvim_create_autocmd('FileType', {
    desc = 'Setup Treesitter or indent folding',
    callback = function(args)
      -- Give LSP a chance to attach first
      vim.defer_fn(function()
        -- Check if buffer still exists
        if not vim.api.nvim_buf_is_valid(args.buf) then return end

        -- Check if LSP folding is already set up
        local has_lsp_folding = false
        for _, client in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
          if client:supports_method('textDocument/foldingRange') then
            has_lsp_folding = true
            break
          end
        end

        if has_lsp_folding then return end

        -- Try treesitter folding
        local lang = vim.treesitter.language.get_lang(args.match)
        if lang and pcall(vim.treesitter.get_parser, args.buf, lang) then
          vim.api.nvim_set_option_value('foldmethod', 'expr', { win = 0 })
          vim.api.nvim_set_option_value('foldexpr', 'v:lua.vim.treesitter.foldexpr()', { win = 0 })
        else
          -- Fallback to indent
          vim.api.nvim_set_option_value('foldmethod', 'indent', { win = 0 })
        end
      end, 100)
    end,
  })
end)
