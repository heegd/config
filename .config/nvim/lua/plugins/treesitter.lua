return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
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
        "yaml",
      },
      sync_install = true,
      auto_install = false,
      highlight = { enable = true },
      autopairs = { enable = true },
      indent = { enable = true, disable = { "dart" } },
      incremental_selection = { enable = true },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      disable = function(lang, buf)
        local max_filesize = 1024 * 1024 -- 1024 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/field region" },
            ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/field region" },

            ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional region" },
            ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional region" },

            ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop region" },
            ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop region" },

            ["ab"] = { query = "@block.outer", desc = "Select outer part of a block region" }, -- overrides default text object block of parenthesis to parenthesis
            ["ib"] = { query = "@block.inner", desc = "Select inner part of a block region" }, -- overrides default text object block of parenthesis to parenthesis

            ["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
            ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },

            ["am"] = { query = "@class.outer", desc = "Select outer part of a class region" },
            ["im"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          },
          include_surrounding_whitespace = true,
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>on"] = "@parameter.inner", -- swap object under cursor with next
          },
          swap_previous = {
            ["<leader>op"] = "@parameter.inner", -- swap object under cursor with previous
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]f"] = { query = "@function.outer", desc = "Next method/function def start" },
            ["]m"] = { query = "@class.outer", desc = "Next class start" },
            ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
            ["]l"] = { query = "@loop.outer", desc = "Next loop start" },
            ["]a"] = { query = "@parameter.outer", desc = "Next parameter start" },
          },
          goto_next_end = {
            ["]F"] = { query = "@function.outer", desc = "Next method/function def end" },
            ["]M"] = { query = "@class.outer", desc = "Next class end" },
            ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
            ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
            ["]A"] = { query = "@parameter.outer", desc = "Next parameter end" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@function.outer", desc = "Prev method/function def start" },
            ["[m"] = { query = "@class.outer", desc = "Prev class start" },
            ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
            ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
            ["[a"] = { query = "@parameter.outer", desc = "Prev parameter start" },
          },
          goto_previous_end = {
            ["[F"] = { query = "@function.outer", desc = "Prev method/function def end" },
            ["[M"] = { query = "@class.outer", desc = "Prev class end" },
            ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
            ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
            ["[A"] = { query = "@parameter.outer", desc = "Prev parameter end" },
          },
        },
      },
    })
  end,
}
