vim.g.loaded_perl_provider = 0 -- disable perl support
vim.g.loaded_ruby_provider = 0 -- disable ruby support
vim.g.loaded_python3_provider = 0 -- disable python3 support
vim.g.have_nerd_font = true -- enable nerd font support
vim.g.mapleader = " " -- sets global leader key
vim.g.maplocalleader = " " -- sets local leader key
vim.opt.compatible = false -- turn off vi compatibility mode
vim.opt.fileencoding = "utf-8" -- encoding set to utf-8
vim.opt.termguicolors = true -- enable true colors in the terminal
vim.opt.background = "dark" -- use dark background
-- vim.cmd("colorscheme retrobox") -- set colorscheme
vim.opt.winborder = "rounded" -- set default border for all floating windows
-- vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#3c3836" })
--vim.api.nvim_set_hl(0, "Normal", { fg = vim.api.nvim_get_hl(0, {name = "Normal"}).fg, bg = "#1d2021" })
--vim.cmd.highlight("SignColumn guibg=NONE")
vim.opt.mouse = "" -- disable mouse support
vim.opt.guicursor = "" -- block cursor in all modes
vim.opt.number = true -- turn on line numbers
vim.opt.relativenumber = true -- turn on relative line numbers
vim.opt.wrap = false -- disable line wrapping
vim.opt.scrolloff = 10 -- keep 10 lines visible above/below cursor
vim.opt.sidescrolloff = 10 -- keep 5 columns visible left/right of cursor during horizontal scroll
vim.opt.pumheight = 10 -- max number of items to show in popup menu
vim.opt.title = true -- show title
vim.opt.showtabline = 2 -- always show the tab line
vim.opt.laststatus = 2 -- always show the statusline
vim.opt.showcmd = true -- show (partial) command in the last line of the screen
vim.opt.cmdheight = 2 -- height of the command line (number of lines)
vim.opt.showmode = true -- show current mode in command line
vim.opt.signcolumn = "yes:2" -- always show 2 sign columns
vim.opt.colorcolumn = "80" -- show column at 80 chars
vim.opt.updatetime = 200 -- faster update time for cursorhold events
vim.opt.timeoutlen = 300 -- timeout for mapped sequences (ms)
vim.g.netrw_banner = 0 -- gets rid of the annoying banner for netrw
vim.g.netrw_browse_split = 4 -- open in prior window
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
vim.opt.shiftwidth = 4 -- indent width for << and >>
vim.opt.tabstop = 4 -- display width of a tab character
vim.opt.softtabstop = 4 -- tab key inserts 4 spaces
vim.opt.list = true -- show whitespace characters
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- characters for tabs, trailing spaces, NBSP

-- Indent behavior (we are disabling some things because of treesitter indentation)
vim.opt.autoindent = true -- copy indent from current line on new line
vim.opt.smartindent = false -- disable smart indent
vim.opt.cindent = false -- disable C-style indent
-- vim.cmd("filetype indent off")           -- old way to disable filetype indent
-- vim.opt.filetype.indent = "off"             -- disable filetype-based indent
-- vim.opt.filetype = "on"                     -- enable filetype detection
vim.cmd("filetype indent off")
vim.cmd("filetype on")

-- 2 spaces languages
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lua",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "html",
    "css",
    "bash",
    "toml",
    "xml",
    "ini",
  },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.opt.completeopt = { "menuone", "noselect" } -- always show completion menu, but don"t auto-select items

-- highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Keymaps

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear search highlight with esc
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down half a page and keep cursor in middle" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up half a page and keep cursor in middle" })

vim.keymap.set("n", "<leader>e", ":25Lexplor<CR>", { desc = "Open Netrw in 25% vertical split (tree view)" })

-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
-- keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
-- keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- plugins start
    {
      "folke/tokyonight.nvim",
      priority = 1000,
      config = function()
        local transparent = false -- set to true if you would like to enable transparency

        local bg = "#011628"
        local bg_dark = "#011423"
        local bg_highlight = "#143652"
        local bg_search = "#0A64AC"
        local bg_visual = "#275378"
        local fg = "#CBE0F0"
        local fg_dark = "#B4D0E9"
        local fg_gutter = "#627E97"
        local border = "#547998"

        require("tokyonight").setup({
          style = "night",
          transparent = transparent,
          styles = {
            sidebars = transparent and "transparent" or "dark",
            floats = transparent and "transparent" or "dark",
          },
          on_colors = function(colors)
            colors.bg = bg
            colors.bg_dark = transparent and colors.none or bg_dark
            colors.bg_float = transparent and colors.none or bg_dark
            colors.bg_highlight = bg_highlight
            colors.bg_popup = bg_dark
            colors.bg_search = bg_search
            colors.bg_sidebar = transparent and colors.none or bg_dark
            colors.bg_statusline = transparent and colors.none or bg_dark
            colors.bg_visual = bg_visual
            colors.border = border
            colors.fg = fg
            colors.fg_dark = fg_dark
            colors.fg_float = fg
            colors.fg_gutter = fg_gutter
            colors.fg_sidebar = fg_dark
          end,
        })

        vim.cmd("colorscheme tokyonight")
      end,
    },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count

        local colors = {
          blue = "#65D1FF",
          green = "#3EFFDC",
          violet = "#FF61EF",
          yellow = "#FFDA7B",
          red = "#FF4A4A",
          fg = "#c3ccdc",
          bg = "#112638",
          inactive_bg = "#2c3043",
        }

        local my_lualine_theme = {
          normal = {
            a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg },
          },
          insert = {
            a = { bg = colors.green, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg },
          },
          visual = {
            a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg },
          },
          command = {
            a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg },
          },
          replace = {
            a = { bg = colors.red, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg },
          },
          inactive = {
            a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
            b = { bg = colors.inactive_bg, fg = colors.semilightgray },
            c = { bg = colors.inactive_bg, fg = colors.semilightgray },
          },
        }

        -- configure lualine with modified theme
        lualine.setup({
          options = {
            theme = my_lualine_theme,
          },
          sections = {
            lualine_x = {
              {
                lazy_status.updates,
                cond = lazy_status.has_updates,
                color = { fg = "#ff9e64" },
              },
              { "encoding" },
              { "fileformat" },
              { "filetype" },
            },
          },
        })
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      event = { "BufReadPre", "BufNewFile" }, -- Only loads treesitter when you actually open a file
      build = ":TSUpdate",
      config = function()
        -- Use Zig compiler for parsers
        require("nvim-treesitter.install").compilers = { "zig" }
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "php",
            "bash",
            "c",
            "diff",
            "html",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "query",
            "vim",
            "vimdoc",
          },
          auto_install = true,
          highlight = { enable = true },
          indent = { enable = true },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "<C-space>",
              node_incremental = "<C-space>",
              scope_incremental = false,
              node_decremental = "<bs>",
            },
          },
          textobjects = {
            select = {
              enable = true,
              lookahead = true,
              keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                ["as"] = {
                  query = "@local.scope",
                  query_group = "locals",
                  desc = "Select language scope",
                },
              },
              selection_modes = {
                ["@parameter.outer"] = "v", -- charwise
                ["@function.outer"] = "V", -- linewise
                ["@class.outer"] = "<c-v>", -- blockwise
              },
              include_surrounding_whitespace = true,
            },
            swap = {
              enable = true,
              swap_next = {
                ["<leader>a"] = "@parameter.inner",
              },
              swap_previous = {
                ["<leader>A"] = "@parameter.inner",
              },
            },
          },
        })
      end,
    },
    { -- Autoformat
      "stevearc/conform.nvim",
      event = { "BufWritePre", "BufNewFile" },
      cmd = { "ConformInfo" },
      keys = {
        {
          "<leader>f",
          function()
            require("conform").format({ async = true, lsp_format = "fallback" })
          end,
          mode = "",
          desc = "[F]ormat buffer",
        },
      },
      opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
          -- Disable "format_on_save lsp_fallback" for languages that don"t
          -- have a well standardized coding style. You can add additional
          -- languages here or re-enable it for the disabled ones.
          local disable_filetypes = { c = true, cpp = true }
          if disable_filetypes[vim.bo[bufnr].filetype] then
            return nil
          else
            return {
              timeout_ms = 500,
              lsp_format = "fallback",
            }
          end
        end,
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform can also run multiple formatters sequentially
          -- python = { "isort", "black" },
          --
          -- You can use "stop_after_first" to run the first available formatter from the list
          -- javascript = { "prettierd", "prettier", stop_after_first = true },
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          svelte = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          graphql = { "prettier" },
          liquid = { "prettier" },
        },
        formatters = {
          prettier = {
            prepend_args = { "--use-tabs=false" },
          },
          stylua = {
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
          },
        },
      },
    },
    -- plugins end
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
