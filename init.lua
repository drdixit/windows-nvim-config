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

------------------------------------
---------- OPENCODE SETUP ----------
------------------------------------
vim.pack.add({
  { src="https://github.com/folke/snacks.nvim" },
  { src="https://github.com/NickvanDyke/opencode.nvim"}
})

require('snacks').setup({
  input = {},
  picker = {},
  terminal = {},
})

---@type opencode.Opts
vim.g.opencode_opts = {
  -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
}

-- Required for `opts.events.reload`.
vim.o.autoread = true

-- Recommended/example keymaps.
vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode" })
vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
vim.keymap.set({ "n", "t" }, "<C-M-b>", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })

vim.keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { expr = true, desc = "Add range to opencode" })
vim.keymap.set("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { expr = true, desc = "Add line to opencode" })

vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "opencode half page up" })
vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "opencode half page down" })

-- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
