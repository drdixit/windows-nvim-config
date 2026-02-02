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
    --
    --
    -- incremental_selection is also gone keep that in mind
    -- incremental_selection = {
    --   enable = true,
    --   keymaps = {
    --     init_selection = "<C-Space>",
    --     node_incremental = "<C-Space>",
    --     scope_incremental = false,
    --     node_decremental = "<BS>",
    --   },
    -- },
    -- you can use this plugins for incremental selection daliusd/incr.nvim
    -- or if you relay on any modules that is from master branch checkout this plugin MeanderingProgrammer/treesitter-modules.nvim
    --
    -- also they drop some commands as well that you run in command line
    -- :TSInstallInfo :TSToggle :TSEnable :TSDisable :TSBufEnable etc.
    --
    require("nvim-treesitter.config").setup({
      ensure_installed = { "php", "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "markdown_inline", "query", "vim", "vimdoc", "dart", },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
