return {
  "saghen/blink.cmp",
  lazy = false,
  dependencies = "rafamadriz/friendly-snippets",
  version = "v1.*",
  opts = {
    appearance = {
      nerd_font_variant = "normal",
    },
    completion = {
      menu = {
        draw = {
          treesitter = {
            "lsp",
          },
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
        },
      },
      documentation = {
        auto_show = true,
      },
    },
  },
}
