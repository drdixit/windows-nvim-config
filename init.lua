require('options')

-- For Updating Plugins use this
-- :lua vim.pack.update()

vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons.git',
  'https://github.com/folke/tokyonight.nvim',
  -- This repository was archived by the owner on Apr 4, 2026. It is now read-only.
  -- so look out for treesitter this config might not work for you
  { src='https://github.com/nvim-treesitter/nvim-treesitter', version='main' },
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  'https://github.com/nvim-telescope/telescope-ui-select.nvim',
})

require('plugins.tokyonight')

require('nvim-treesitter.config').setup({
  ensure_installed = { 'dart' },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true }
})

require('plugins.gitsigns')

-- You have to manually build fzfnative using :BuildFzfNative command this works on windows
vim.api.nvim_create_user_command('BuildFzfNative', function()
  local data = vim.fn.stdpath('data')
  local path = data .. '/site/pack/core/opt/telescope-fzf-native.nvim'
  vim.system({
    'cmd', '/C',
    'cmake -S . -B build -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  }, { cwd = path }):wait()
  print('telescope-fzf-native built; check build/libfzf.dll')
end, {})

require('plugins.telescope')

