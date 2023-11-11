return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      local indent_blankline = require("ibl")

      indent_blankline.setup {
        scope = { enabled = true, show_start = false },
        exclude = {
          filetypes = { "help", "packer", "NvimTree" },
          buftypes = { "terminal", "nofile" }
        }
      }
    end
  }
}
