return {
  "windwp/nvim-autopairs",
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({
      check_ts = true, -- treesitter integration
    })
  end,
}
