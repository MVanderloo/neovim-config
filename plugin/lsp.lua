vim.pack.add({
  'https://github.com/b0o/SchemaStore.nvim',
  'https://github.com/neovim/nvim-lspconfig',
}, { confirm = false })

vim.lsp.enable {
  'ansiblels',
  'awk_ls',
  'bashls',
  'cssls',
  'docker_compose_language_service',
  'docker_language_server',
  'emmylua_ls',
  'fish_lsp',
  'gh_actions_ls',
  'gopls',
  'html_ls',
  'jqls',
  'jsonls',
  'just',
  'nixd',
  'postgres_lsp',
  'ruff',
  'rust_analyzer',
  'systemd_ls',
  'taplo',
  'tinymist',
  'ty',
  'yamlls',
  'zls',
}

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Configure LSP keymaps',
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local map = function(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, { buffer = args.buf }) end
    if client:supports_method 'textDocument/definition' then
      map('n', 'gld', vim.lsp.buf.definition)
      map('n', 'gd', vim.lsp.buf.definition)
    end
    if client:supports_method 'textDocument/references' then map('n', 'glr', vim.lsp.buf.references) end
    if client:supports_method 'textDocument/typeDefinition' then map('n', 'glt', vim.lsp.buf.type_definition) end
    if client:supports_method 'textDocument/implementation' then map('n', 'gli', vim.lsp.buf.implementation) end
    if client:supports_method 'textDocument/codeAction' then map('n', 'gla', vim.lsp.buf.code_action) end
    if client:supports_method 'textDocument/rename' then map('n', 'gln', vim.lsp.buf.rename) end
    if client:supports_method 'textDocument/hover' then map({ 'n', 'x' }, 'K', vim.lsp.buf.hover) end
    -- if client:supports_method 'textDocument/documentColor' then vim.lsp.document_color.enable(true, args.buf) end
    if client:supports_method 'textDocument/signatureHelp' then map({ 'i' }, '<C-k>', vim.lsp.buf.signature_help) end
    if client:supports_method 'textDocument/documentHighlight' then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'InsertLeave' }, {
        desc = 'Highlight references under the cursor',
        buffer = args.buf,
        callback = vim.lsp.buf.document_highlight,
        group = Config.my_augroup,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'InsertEnter', 'BufLeave' }, {
        desc = 'Clear highlight references',
        buffer = args.buf,
        callback = vim.lsp.buf.clear_references,
        group = Config.my_augroup,
      })
    end
  end,
  group = Config.my_augroup,
})
