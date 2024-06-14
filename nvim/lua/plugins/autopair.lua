return {
  "windwp/nvim-autopairs",
  dependencies = {
    "hrsh7th/nvim-cmp"
  },
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup {
      check_ts = true, -- treesitter integration
    }

    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on(
      "confirm_done",
      cmp_autopairs.on_confirm_done()
    )
  end
}
