return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    local langs = {
      "c",
      "dart",
      "html",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "sql",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    }
    ts.install(langs)

    local ts_to = require("nvim-treesitter-textobjects")
    ts_to.setup({ move = { set_jumps = true }, select = { lookahead = true } })

    -- select
    local ts_to_s = require("nvim-treesitter-textobjects.select")
    -- class
    vim.keymap.set({ "n" }, "am", function()
      ts_to_s.select_textobject("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "n" }, "im", function()
      ts_to_s.select_textobject("@class.inner", "textobjects")
    end)
    -- function
    vim.keymap.set({ "n" }, "af", function()
      ts_to_s.select_textobject("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "n" }, "if", function()
      ts_to_s.select_textobject("@function.inner", "textobjects")
    end)
    -- parameter
    vim.keymap.set({ "n" }, "aa", function()
      ts_to_s.select_textobject("@parameter.outer", "textobjects")
    end)
    vim.keymap.set({ "n" }, "ia", function()
      ts_to_s.select_textobject("@parameter.inner", "textobjects")
    end)
    -- block
    vim.keymap.set({ "n" }, "ab", function()
      ts_to_s.select_textobject("@block.outer", "textobjects")
    end)
    vim.keymap.set({ "n" }, "ib", function()
      ts_to_s.select_textobject("@block.inner", "textobjects")
    end)

    -- move
    local ts_to_m = require("nvim-treesitter-textobjects.move")
    -- class
    vim.keymap.set({ "n" }, "]m", function()
      ts_to_m.goto_next_start("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "n" }, "[m", function()
      ts_to_m.goto_previous_start("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "n" }, "]M", function()
      ts_to_m.goto_next_end("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "n" }, "[M", function()
      ts_to_m.goto_previous_end("@class.outer", "textobjects")
    end)
    -- function
    vim.keymap.set({ "n" }, "]f", function()
      ts_to_m.goto_next_start("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "n" }, "[f", function()
      ts_to_m.goto_previous_start("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "n" }, "]F", function()
      ts_to_m.goto_next_end("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "n" }, "[F", function()
      ts_to_m.goto_previous_end("@function.outer", "textobjects")
    end)
    -- parameter
    vim.keymap.set({ "n" }, "]p", function()
      ts_to_m.goto_next_start("@parameter.outer", "textobjects")
    end)
    vim.keymap.set({ "n" }, "[p", function()
      ts_to_m.goto_previous_start("@parameter.outer", "textobjects")
    end)
    vim.keymap.set({ "n" }, "]P", function()
      ts_to_m.goto_next_end("@parameter.outer", "textobjects")
    end)
    vim.keymap.set({ "n" }, "[P", function()
      ts_to_m.goto_previous_end("@parameter.outer", "textobjects")
    end)
    -- block
    vim.keymap.set({ "n" }, "]b", function()
      ts_to_m.goto_next_start("@block.outer", "textobjects")
    end)
    vim.keymap.set({ "n" }, "[b", function()
      ts_to_m.goto_previous_start("@block.outer", "textobjects")
    end)
    vim.keymap.set({ "n" }, "]B", function()
      ts_to_m.goto_next_end("@block.outer", "textobjects")
    end)
    vim.keymap.set({ "n" }, "[B", function()
      ts_to_m.goto_previous_end("@block.outer", "textobjects")
    end)
  end,
}
