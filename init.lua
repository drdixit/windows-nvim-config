require("basic")
require("config.lazy")

local transparent = true -- set to true to enable transparency, false to disable

local function apply_transparency()
  if transparent then

    -- Core UI
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })           -- Main editor background
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })      -- Floating window background
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })         -- Non-current window background
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })       -- Sign column/gutter background (git signs, diagnostics)
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })       -- Active status line background
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })     -- Inactive status line background
    vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })        -- Vertical split separator background
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })           -- Line number column background
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })     -- Current line number background

    -- GitSigns
    -- vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#A6E22E", bg = "NONE" })      -- Monokai green
    -- vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#66D9EF", bg = "NONE" })   -- Monokai cyan
    -- vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#F92672", bg = "NONE" })   -- Monokai red

    -- GitSigns for base16-hardcore
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#70d675", bg = "NONE" })      -- hardcore green
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#66d9ef", bg = "NONE" })   -- hardcore cyan
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#f92672", bg = "NONE" })   -- hardcore red

  end
end

-- Apply transparency after everything loads
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.schedule(apply_transparency)
  end,
  desc = "Apply transparency after all plugins load",
})

-- Create autocommand to reapply transparency on colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = apply_transparency,
  desc = "Apply transparency settings after colorscheme change",
})

