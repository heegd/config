--[[
normal_mode = "n",
insert_mode = "i",
visual_mode = "v",
visual_block_mode = "x",
term_mode = "t",
command_mode = "c"
]]

local keymap = vim.keymap

-- Common commands
keymap.set("n", "<leader>q", ":q<cr>", { desc = "Quit" })
keymap.set("n", "<leader>Q", ":qa<cr>", { desc = "Quit all" })
keymap.set("n", "<leader>w", ":w<cr>", { desc = "Write" })
keymap.set("n", "<leader>W", ":wa<cr>", { desc = "Write all" })

-- Quickfix List
keymap.set("n", "<leader>Co", ":copen<cr>", { noremap = true, silent = true, desc = "Qflist open" })
keymap.set("n", "<leader>Cc", ":cclose<cr>", { noremap = true, silent = true, desc = "Qflist close" })
keymap.set("n", "<leader>Cn", ":cnext<cr>", { noremap = true, silent = true, desc = "Qflist next" })
keymap.set("n", "]q", ":cnext<cr>", { noremap = true, silent = true, desc = "Qflist next" })
keymap.set("n", "<leader>Cp", ":cprevious<cr>", { noremap = true, silent = true, desc = "Qflist prev" })
keymap.set("n", "[q", ":cprevious<cr>", { noremap = true, silent = true, desc = "Qflist prev" })

-- Location List
keymap.set("n", "<leader>co", ":lopen<cr>", { noremap = true, silent = true, desc = "Loclist open" })
keymap.set("n", "<leader>cc", ":lclose<cr>", { noremap = true, silent = true, desc = "Loclist close" })
keymap.set("n", "<leader>cn", ":lnext<cr>", { noremap = true, silent = true, desc = "Loclist next" })
keymap.set("n", "<leader>cp", ":lprevious<cr>", { noremap = true, silent = true, desc = "Loclist prev" })

-- Diagnostics
keymap.set("n", "<leader>df", vim.diagnostic.open_float, { noremap = true, silent = true, desc = "Diagnostics float" })
keymap.set("n", "<leader>dl", vim.diagnostic.setloclist,
  { noremap = true, silent = true, desc = "Diagnostics set loclist" })
keymap.set("n", "<leader>dL", vim.diagnostic.setqflist,
  { noremap = true, silent = true, desc = "Diagnostics set qflist" })
keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "Diagnostics prev" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Diagnostics next" })
