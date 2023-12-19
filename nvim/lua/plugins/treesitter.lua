return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      -- https://github.com/nvim-treesitter/nvim-treesitter/issues/4945
      local parser = require("nvim-treesitter.parsers").get_parser_configs()
      parser.dart = {
        install_info = {
          url = "https://github.com/UserNobody14/tree-sitter-dart",
          files = { "src/parser.c", "src/scanner.c" },
          revision = "8aa8ab977647da2d4dcfb8c4726341bee26fbce4", -- The last commit before the snail speed
        },
      }

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
        auto_install = true,
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
