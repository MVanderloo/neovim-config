---@type vim.lsp.Config
return {
  cmd = { 'ruff', 'server', '--preview' },
  root_markers = { 'pyproject.toml', '.git' },
  filetypes = { 'python' },
}
