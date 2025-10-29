vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear search highlight with esc
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down half a page and keep cursor in middle" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up half a page and keep cursor in middle" })

vim.keymap.set("n", "<leader>e", ":25Lexplor<CR>", { desc = "Open Netrw in 25% vertical split (tree view)" })

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
