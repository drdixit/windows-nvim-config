vim.g.loaded_perl_provider = 0 -- disable perl support
vim.g.loaded_ruby_provider = 0 -- disable ruby support
vim.g.loaded_python3_provider = 0 -- disable python3 support

-- Neovide specific settings
-- if vim.g.neovide then
--   vim.g.neovide_opacity = 0.90
--   vim.g.neovide_refresh_rate = 60
--   vim.g.neovide_background_color = "#011628"
--   vim.g.neovide_floating_blur_amount_x = 12.0
--   vim.g.neovide_floating_blur_amount_y = 12.0
--   vim.g.neovide_window_blurred = true
--   vim.o.guifont = "JetBrainsMono Nerd Font:h13"
-- end

require("config.options")
require("config.keymaps")
require("config.lazy")
-- require("config.wezterm")
