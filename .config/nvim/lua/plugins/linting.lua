return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    lint.linters.flake8.args = { "--max-line-length=88" }
    lint.linters_by_ft = {
      python = { "flake8" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
