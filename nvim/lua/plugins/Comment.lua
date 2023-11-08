return {
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      local comment = require("Comment")
      local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

      comment.setup {
        toggler = {
          ---Line-comment toggle keymap
          line = "<leader>cl",
          ---Block-comment toggle keymap
          block = "<leader>cb",
        },
        opleader = {
          ---Line-comment keymap
          line = "<leader>cl",
          ---Block-comment keymap
          block = "<leader>cb",
        },
        pre_hook = ts_context_commentstring.create_pre_hook(),
      }
    end,
  }
}
