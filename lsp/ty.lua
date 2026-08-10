---@type vim.lsp.Config
return {
  cmd = { 'ty', 'server' },
  root_markers = { 'pyproject.toml', '.git' },
  filetypes = { 'python' },
}
