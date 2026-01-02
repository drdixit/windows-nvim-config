vim.pack.add({
  { src="https://github.com/folke/snacks.nvim" },
  { src="https://github.com/NickvanDyke/opencode.nvim" },
})

require('snacks').setup({
  input = {},
  picker = {},
  terminal = {}
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
vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })

vim.keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { expr = true, desc = "Add range to opencode" })
vim.keymap.set("n", "goo", function() return require("opencode").operator("@this ") .. "_" end, { expr = true, desc = "Add line to opencode" })

vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "opencode half page up" })
vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "opencode half page down" })

-- Fix diagnostics with OpenCode
vim.keymap.set("n", "<leader>fd", function() 
  require("opencode").ask("@diagnostics Fix all diagnostics in this file", { submit = true }) 
end, { desc = "Fix diagnostics with OpenCode" })

-- Additional useful OpenCode keybindings
vim.keymap.set("n", "<leader>oe", function() 
  require("opencode").ask("@this Explain this code in simple terms", { submit = true }) 
end, { desc = "Explain code" })

vim.keymap.set("n", "<leader>or", function() 
  require("opencode").ask("@this Refactor this code to improve readability and performance", { submit = true }) 
end, { desc = "Refactor code" })

vim.keymap.set("n", "<leader>ot", function() 
  require("opencode").ask("@this Write unit tests for this code", { submit = true }) 
end, { desc = "Generate tests" })

vim.keymap.set("n", "<leader>od", function() 
  require("opencode").ask("@this Add comprehensive documentation/comments to this code", { submit = true }) 
end, { desc = "Add documentation" })

vim.keymap.set("n", "<leader>ob", function() 
  require("opencode").ask("@this Find and fix potential bugs in this code", { submit = true }) 
end, { desc = "Find bugs" })

vim.keymap.set("n", "<leader>oo", function() 
  require("opencode").ask("@this Optimize this code for better performance", { submit = true }) 
end, { desc = "Optimize code" })

vim.keymap.set({ "n", "x" }, "<leader>oc", function() 
  require("opencode").ask("@this Review this code and suggest improvements", { submit = true }) 
end, { desc = "Code review" })

vim.keymap.set("n", "<leader>of", function() 
  require("opencode").ask("@this Format and clean up this code following best practices", { submit = true }) 
end, { desc = "Format code" })

-- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
