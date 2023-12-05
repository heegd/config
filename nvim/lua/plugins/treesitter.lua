return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "sql",
          "python",
          "markdown",
          "markdown_inline",
          "html",
          "dart",
          "yaml"
        },
        sync_install = true,
        auto_install = false,
        highlight = { enable = true },
        autopairs = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<leader>v",
            node_incremental = "<C-n>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-p>",
          },
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        }
      })
    end
  }
}
