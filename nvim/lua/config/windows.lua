local powershell_options = {
  shell = "pwsh",
  shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end

-- Suspend doesn"t work on windows and just locks everything up so remap to no operation.
vim.api.nvim_set_keymap("n", "<c-z>", "<nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<c-z>", "<nop>", { noremap = true, silent = true })

-- Generate and insert GUID
vim.api.nvim_set_keymap("n", "<leader>rg", ":ReadCmdAfter [guid]::NewGuid().Guid<cr>", { noremap = true, silent = true, desc = "Insert GUID after cursor" })
vim.api.nvim_set_keymap("n", "<leader>rG", ":ReadCmdBefore [guid]::NewGuid().Guid<cr>", { noremap = true, silent = true, desc = "Insert GUID after cursor" })

-- Reset tmp so that nvim doesn"t fail after the windows temp folder is emptied
vim.cmd [[
  let $TMP = "D:\\Tmp"
]]
