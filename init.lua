vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0

vim.opt.termguicolors = true
vim.g.have_nerd_font = true
vim.opt.background = "dark"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.updatetime = 200
vim.opt.timeoutlen = 300
vim.opt.guicursor = ""
vim.opt.mouse = ""
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes:2"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.backspace = "indent,eol,start"
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.confirm = true

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"

vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Amount to indent with << and >>
vim.opt.tabstop = 4 -- How many spaces are shown per Tab
vim.opt.softtabstop = 4 -- How many spaces are applied when pressing Tab
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.autoindent = true
vim.opt.smartindent = false
vim.opt.cindent = false
-- vim.cmd("filetype indent off")
-- or
vim.opt.filetype = "on"
vim.opt.filetype.indent = "off"  -- Lua way (if supported)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "javascript", "typescript", "javascriptreact", "typescriptreact", "html", "css", "bash", "toml", "xml", "ini" }, -- 2 spaces languages
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

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

require("lazy").setup({
  spec = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      init = function()
        require("nvim-treesitter.install").compilers = { "zig" }
      end,
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = { "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "markdown_inline", "query", "vim", "vimdoc" },
          auto_install = true,
          highlight = { enable = true, },
          indent = { enable = true },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "<C-space>",
              node_incremental = "<C-space>",
              scope_incremental = false,
              node_decremental = "<bs>",
            }
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
                ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
              },
              selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
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
            }
          }
        })
      end
    },
    {
      "folke/tokyonight.nvim",
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
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
          on_colors = function(colors)
            colors.bg = bg
            colors.bg_dark = bg_dark
            colors.bg_float = bg_dark
            colors.bg_highlight = bg_highlight
            colors.bg_popup = bg_dark
            colors.bg_search = bg_search
            colors.bg_sidebar = bg_dark
            colors.bg_statusline = bg_dark
            colors.bg_visual = bg_visual
            colors.border = border
            colors.fg = fg
            colors.fg_dark = fg_dark
            colors.fg_float = fg
            colors.fg_gutter = fg_gutter
            colors.fg_sidebar = fg_dark
          end,
        })
        -- load the colorscheme here
        vim.cmd([[colorscheme tokyonight]])
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
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      -- or if using mini.icons/mini.nvim
      -- dependencies = { "echasnovski/mini.icons" },
      opts = {},
      config = function()
        require("fzf-lua").setup({
          fzf_colors = {
            true,
            ["fg"]          = { "fg", "CursorLine" },
            ["bg"]          = { "bg", "Normal" },
            ["hl"]          = { "fg", "Comment" },
            ["fg+"]         = { "fg", "Normal", "underline" },
            ["bg+"]         = { "bg", { "CursorLine", "Normal" } },
            ["hl+"]         = { "fg", "Statement" },
            ["info"]        = { "fg", "PreProc" },
            ["prompt"]      = { "fg", "Conditional" },
            ["pointer"]     = { "fg", "Exception" },
            ["marker"]      = { "fg", "Keyword" },
            ["spinner"]     = { "fg", "Label" },
            ["header"]      = { "fg", "Comment" },
            ["gutter"]      = "-1",
          },
        })
        vim.keymap.set("n", "<leader><leader>", "<cmd>FzfLua buffers<cr>", { desc = "[ ] Find existing buffers" })
        vim.keymap.set("n", "<leader>sh", "<cmd>FzfLua help_tags<cr>", { desc = "[S]earch [H]elp" })
        vim.keymap.set("n", "<leader>sk", "<cmd>FzfLua keymaps<cr>", { desc = "[S]earch [K]eymaps" })
        vim.keymap.set("n", "<leader>sf", "<cmd>FzfLua files<cr>", { desc = "[S]earch [F]iles" })
        vim.keymap.set("n", "<leader>sg", "<cmd>FzfLua live_grep<cr>", { desc = "[S]earch by [G]rep" })
        vim.keymap.set("n", "<leader>sw", "<cmd>FzfLua grep_cword<cr>", { desc = "[S]earch current [W]ord" })
      end,
    },
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
      "lewis6991/gitsigns.nvim",
      opts = {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      },
    },

    {
      "github/copilot.vim",
    },

  },
  install = { colorscheme = { "tokyonight" } },
  checker = {
    enabled = true,
    notify = false,
  },
})

vim.diagnostic.config({
  -- virtual_lines = true,
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
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
})
