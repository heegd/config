-- local powershell_options = {
--   shell = "pwsh",
--   shellcmdflag =
--   "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
--   shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
--   shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
--   shellquote = "",
--   shellxquote = "",
-- }

local shell_options = {
  shell = "bash",
  shellcmdflag = "-c",
  shellredir = "",
  shellpipe = "",
  shellquote = "",
  shellxquote = "",
  shellslash = true
}

for option, value in pairs(shell_options) do
  vim.opt[option] = value
end

-- Suspend doesn"t work on windows and just locks everything up so remap to no operation.
vim.api.nvim_set_keymap("n", "<c-z>", "<nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<c-z>", "<nop>", { noremap = true, silent = true })

-- Generate and insert GUID
vim.api.nvim_set_keymap("n", "<leader>rg", ":ReadCmdAfter python -c 'import sys, uuid; sys.stdout.write(str(uuid.uuid4()))'<cr>", { noremap = true, silent = true, desc = "Insert GUID after cursor" })
vim.api.nvim_set_keymap("n", "<leader>rG", ":ReadCmdBefore python -c 'import sys, uuid; sys.stdout.write(str(uuid.uuid4()))'<cr>", { noremap = true, silent = true, desc = "Insert GUID before cursor" })

-- Reset tmp so that nvim doesn"t fail after the windows temp folder is emptied
vim.cmd [[
  let $TMP = "D:\\Tmp"
]]
