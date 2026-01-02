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

