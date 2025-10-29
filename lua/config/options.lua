vim.opt.compatible = false -- turn off vi compatibility mode
vim.opt.fileencoding = "utf-8" -- encoding set to utf-8

vim.g.mapleader = " " -- sets global leader key
vim.g.maplocalleader = " " -- sets local leader key

vim.g.have_nerd_font = true -- enable nerd font support
vim.opt.termguicolors = true -- enable true colors in the terminal
vim.opt.background = "dark" -- use dark background

vim.opt.mouse = "" -- disable mouse support
vim.opt.guicursor = "" -- block cursor in all modes

vim.opt.number = true -- turn on line numbers
vim.opt.relativenumber = true -- turn on relative line numbers
vim.opt.wrap = false -- disable line wrapping
vim.opt.scrolloff = 10 -- keep 10 lines visible above/below cursor
vim.opt.sidescrolloff = 10 -- keep 5 columns visible left/right of cursor during horizontal scroll

vim.opt.pumheight = 10 -- max number of items to show in popup menu
vim.opt.title = true -- show title
-- vim.opt.showtabline = 2 -- always show the tab line
vim.opt.laststatus = 2 -- always show the statusline
vim.opt.showcmd = true -- show (partial) command in the last line of the screen
vim.opt.cmdheight = 2 -- height of the command line (number of lines)

vim.opt.showmode = true -- show current mode in command line
vim.opt.signcolumn = "yes:2" -- always show 2 sign columns
vim.opt.colorcolumn = "120" -- show column at 120 chars
vim.opt.updatetime = 200 -- faster update time for cursorhold events
vim.opt.timeoutlen = 300 -- timeout for mapped sequences (ms)

vim.g.netrw_banner = 0 -- gets rid of the annoying banner for netrw
-- vim.g.netrw_browse_split = 4 -- open in prior window

vim.g.netrw_altv = 1 -- change from left splitting to right splitting
vim.g.netrw_liststyle = 3 -- tree style view in netrw

vim.opt.splitright = true -- vertical splits open to the right
vim.opt.splitbelow = true -- horizontal splits open below

vim.opt.splitkeep = "screen" -- keep text stable when splitting
vim.opt.backspace = "indent,eol,start" -- make backspace work in insert mode
vim.opt.virtualedit = "block" -- allow cursor anywhere in visual block mode
vim.opt.inccommand = "split" -- show live preview of :substitute in a split
vim.opt.confirm = true -- ask for confirmation instead of errors

vim.opt.incsearch = true -- show search matches as you type
vim.opt.ignorecase = true -- ignore case in search by default
vim.opt.smartcase = true -- override ignorecase if search has capitals

vim.opt.swapfile = false -- disable swap file
vim.opt.backup = false -- disable backup file
vim.opt.undofile = true -- enable persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir" -- undo directory path

-- Indentation
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- indent width for << and >>
vim.opt.tabstop = 2 -- display width of a tab character
vim.opt.softtabstop = 2 -- tab key inserts 2 spaces
vim.opt.list = true -- show whitespace characters
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- characters for tabs, trailing spaces, NBSP

-- Indent behavior (we are disabling some things because of treesitter indentation)
vim.opt.autoindent = true -- copy indent from current line on new line
vim.opt.smartindent = false -- disable smart indent DISABLE (conflicts with treesitter)
vim.opt.cindent = false -- disable C-style indent DISABLE (conflicts with treesitter)
vim.cmd("filetype indent off") -- DISABLE (conflicts with treesitter)
vim.cmd("filetype on")

vim.opt.completeopt = { "menuone", "noselect" } -- always show completion menu, but don"t auto-select items

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

