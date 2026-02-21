return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "html",
      "jsonls",
      "lua_ls",
      "marksman",
      "pyright",
      "ruff",
      "ts_ls",
    },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {
      pip = { upgrade_pip = true },
    } },
    "neovim/nvim-lspconfig",
  },
}
