return {
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({
        transparent = true,
        errors = { mode = "fg" },
        diff = { mode = "fg" },
        styles = {
          comments = { italic = false },
          bufferline = {
            modified = { italic = false }
          }
        }
      })

      vim.cmd [[colorscheme nord]]
    end
  }
}
