vim.lsp.config('*', { root_markers = { '.git' } })
vim.lsp.enable('dartls')
require("options")
require("config.lazy")
