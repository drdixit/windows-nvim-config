return {
  "saghen/blink.cmp",
  version = "1.*",
  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
      ["<C-d>"] = { "scroll_documentation_down" },
      ["<C-u>"] = { "scroll_documentation_up" },
    },
    appearance = { nerd_font_variant = "normal" },
    signature = { enabled = true },
    completion = {
      menu = { border = "rounded" },
      documentation = { auto_show = true, window = { border = "rounded" } },
    },
    sources = { default = { "lsp", "path", "buffer" }, },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}

