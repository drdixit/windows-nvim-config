return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".git", ".luarc.json", ".luarc.jsonc" },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
}
