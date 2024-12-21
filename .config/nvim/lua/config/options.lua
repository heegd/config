vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.diffopt = vim.opt.diffopt + "algorithm:histogram" + "indent-heuristic" + "linematch:60"
vim.opt.expandtab = true
vim.opt.fillchars = "diff: "
vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case --hidden"
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.iskeyword:append("-")
vim.opt.list = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.showmatch = true
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.wrap = false

-- Set the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- folding from treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- Highlight yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 300 })
    end,
})

-- diagnostics config
local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
    virtual_text = false, -- disable virtual text
    signs = {
        active = signs, -- show signs
    },
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
}

vim.diagnostic.config(config)
