return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- okay as 31 Jan, 2026 Stuff has changed
    -- we are pulling main by default so on main branch they change the name
    -- of the module from configs => config
    -- so you do nvim-treesitter.config not nvim-treesitter.configs
    --
    -- so if you use master branch then you get one combined config for both treesitter and text objects
    -- but if you use main branch then you need to seperately configure text objects through ("nvim-treesitter-textobjects").setup
    require("nvim-treesitter.config").setup({
      ensure_installed = { "php", "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "markdown_inline", "query", "vim", "vimdoc", "dart", },
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
    })
  end,
}
