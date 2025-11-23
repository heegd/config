local keymap = vim.keymap

-- https://www.reddit.com/r/neovim/comments/1h6k12y/override_or_delete_original_filetypevim_mappings/
vim.g.no_python_maps = 1 -- Disable built-in python mappings

-- Common
keymap.set("n", "<leader>q", ":q<cr>", { desc = "Quit" })
keymap.set("n", "<leader>Q", ":qa<cr>", { desc = "Quit all" })
keymap.set("n", "<leader>w", ":w<cr>", { desc = "Write" })
keymap.set("n", "<leader>W", ":wa<cr>", { desc = "Write all" })

-- Quickfix List
keymap.set("n", "<leader>lo", ":copen<cr>", { noremap = true, silent = true, desc = "Qflist open" })
keymap.set("n", "<leader>lc", ":cclose<cr>", { noremap = true, silent = true, desc = "Qflist close" })
keymap.set("n", "<leader>ln", ":cnext<cr>", { noremap = true, silent = true, desc = "Qflist next" })
keymap.set("n", "]]", ":cnext<cr>", { noremap = true, silent = true, desc = "Qflist next" })
keymap.set("n", "<leader>lp", ":cprevious<cr>", { noremap = true, silent = true, desc = "Qflist prev" })
keymap.set("n", "[[", ":cprevious<cr>", { noremap = true, silent = true, desc = "Qflist prev" })

-- Location List
keymap.set("n", "<leader>Lo", ":lopen<cr>", { noremap = true, silent = true, desc = "Loclist open" })
keymap.set("n", "<leader>Lc", ":lclose<cr>", { noremap = true, silent = true, desc = "Loclist close" })
keymap.set("n", "<leader>Ln", ":lnext<cr>", { noremap = true, silent = true, desc = "Loclist next" })
keymap.set("n", "]}", ":lnext<cr>", { noremap = true, silent = true, desc = "Loclist next" })
keymap.set("n", "<leader>Lp", ":lprevious<cr>", { noremap = true, silent = true, desc = "Loclist prev" })
keymap.set("n", "[{", ":lprevious<cr>", { noremap = true, silent = true, desc = "Loclist prev" })

-- Diagnostics
keymap.set("n", "<leader>df", vim.diagnostic.open_float, { noremap = true, silent = true, desc = "Diagnostics float" })
keymap.set(
  "n",
  "<leader>dL",
  vim.diagnostic.setloclist,
  { noremap = true, silent = true, desc = "Diagnostics set loclist" }
)
keymap.set(
  "n",
  "<leader>dl",
  vim.diagnostic.setqflist,
  { noremap = true, silent = true, desc = "Diagnostics set qflist" }
)
keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { noremap = true, silent = true, desc = "Diagnostics prev" })
keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { noremap = true, silent = true, desc = "Diagnostics next" })

-- Lsp
keymap.set("n", "gr", "<NOP>")
keymap.set("n", "grn", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "LSP Rename" })
keymap.set("n", "gra", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "LSP Rename" })
keymap.set("n", "grr", vim.lsp.buf.references, { noremap = true, silent = true, desc = "LSP Rename" })
keymap.set("n", "gri", vim.lsp.buf.implementation, { noremap = true, silent = true, desc = "LSP Rename" })
keymap.set("n", "gO", vim.lsp.buf.document_symbol, { noremap = true, silent = true, desc = "LSP Rename" })
keymap.set("i", "<C-S>", vim.lsp.buf.signature_help, { noremap = true, silent = true, desc = "LSP Rename" })
