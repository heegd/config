return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  build = ":TSUpdate",
  opts = {
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
      "yaml",
    },
    sync_install = true,
    auto_install = false,
    highlight = { enable = true },
    autopairs = { enable = true },
    indent = { enable = true, disable = { "dart" } },
    incremental_selection = { enable = true },
    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/field region" },
          ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/field region" },

          ["ab"] = { query = "@block.outer", desc = "Select outer part of a block region" }, -- overrides default text object block of parenthesis to parenthesis
          ["ib"] = { query = "@block.inner", desc = "Select inner part of a block region" }, -- overrides default text object block of parenthesis to parenthesis

          ["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
          ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },

          ["am"] = { query = "@class.outer", desc = "Select outer part of a class region" },
          ["im"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        },
        include_surrounding_whitespace = false,
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]f"] = { query = "@function.outer", desc = "Next method/function def start" },
          ["]m"] = { query = "@class.outer", desc = "Next class start" },
          ["]a"] = { query = "@parameter.outer", desc = "Next parameter start" },
          ["]b"] = { query = "@block.outer", desc = "Next block start" },
        },
        goto_next_end = {
          ["]F"] = { query = "@function.outer", desc = "Next method/function def end" },
          ["]M"] = { query = "@class.outer", desc = "Next class end" },
          ["]A"] = { query = "@parameter.outer", desc = "Next parameter end" },
          ["]B"] = { query = "@block.outer", desc = "Next block end" },
        },
        goto_previous_start = {
          ["[f"] = { query = "@function.outer", desc = "Prev method/function def start" },
          ["[m"] = { query = "@class.outer", desc = "Prev class start" },
          ["[a"] = { query = "@parameter.outer", desc = "Prev parameter start" },
          ["[b"] = { query = "@block.outer", desc = "Prev block start" },
        },
        goto_previous_end = {
          ["[F"] = { query = "@function.outer", desc = "Prev method/function def end" },
          ["[M"] = { query = "@class.outer", desc = "Prev class end" },
          ["[A"] = { query = "@parameter.outer", desc = "Prev parameter end" },
          ["[B"] = { query = "@block.outer", desc = "Prev block end" },
        },
      },
    },
  },
}
