require('options')

-- require('colorscheme').setup('ayu-dark')
-- require('colorscheme').setup('material-darker')
-- require('colorscheme').setup('material')
require('colorscheme').setup('default-dark')
vim.cmd([[
  highlight Normal guibg=none
  highlight NormalFloat guibg=none
  highlight SignColumn guibg=none
  highlight LineNr guibg=none
]])

vim.pack.add({ "https://github.com/nvim-tree/nvim-web-devicons.git" })
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.gitsigns')

---------------------------------------
---------- LSP CONFIGURATION ----------
---------------------------------------

vim.lsp.enable("dartls")

vim.diagnostic.config({
  update_in_insert = false,
  severity_sort = true,

  float = { border = "rounded", source = true },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },

  virtual_text = {
    source = true,
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
})

vim.pack.add({
  { src="https://github.com/saghen/blink.cmp", version=vim.version.range("1") },
})
require("blink.cmp").setup({
  keymap = { preset = 'default' },
  appearance = {
    nerd_font_variant = 'normal'
  },
  completion = { documentation = { auto_show = true } },
  sources = {
    default = { 'lsp', 'path', 'buffer' },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" }
})
