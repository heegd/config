return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local nvim_tree = require("nvim-tree")

    nvim_tree.setup {
      renderer = {
        root_folder_modifier = ":t",
        indent_markers = {
          enable = true
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
      },
      view = {
        adaptive_size = true,
        side = "left",
        preserve_window_proportions = true
      },
      actions = {
        change_dir = {
          enable = false
        }
      },
    }

    local keymap = vim.keymap
    keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "File tree" })
  end
}
