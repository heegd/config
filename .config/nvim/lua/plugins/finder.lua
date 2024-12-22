return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local actions = require("fzf-lua.actions")
    require("fzf-lua").setup({
      actions = {
        files = {
          true,
          ["ctrl-y"] = actions.file_edit_or_qf,
        },
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Find buffers" })
    keymap.set("n", "<leader>fc", "<cmd>FzfLua commands<cr>", { desc = "Find commands" })
    keymap.set("n", "<leader>fd", "<cmd>FzfLua diagnostics_workspace<cr>", { desc = "Find diagnostics" })
    keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find files" })
    keymap.set("n", "<leader>fg", "<cmd>FzfLua grep<cr>", { desc = "Find text" })
    keymap.set("n", "<leader>fh", "<cmd>FzfLua helptags<cr>", { desc = "Find help" })
    keymap.set("n", "<leader>fl", "<cmd>FzfLua loclist<cr>", { desc = "Find loclist" })
    keymap.set("n", "<leader>fq", "<cmd>FzfLua quickfix<cr>", { desc = "Find quickfix" })
    keymap.set("n", "<leader>fr", "<cmd>FzfLua lsp_references<cr>", { desc = "Find references" })
    keymap.set("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Find document symbols" })
  end,
}

-- {
--     "nvim-telescope/telescope.nvim",
--     branch = "0.1.x",
--     dependencies = {
--         {
--             "nvim-telescope/telescope-fzf-native.nvim",
--             build = "make",
--         },
--         "nvim-tree/nvim-web-devicons",
--         "nvim-lua/plenary.nvim",
--     },
--     config = function()
--         local telescope = require("telescope")
--         local actions = require("telescope.actions")
--
--         telescope.setup({
--             defaults = {
--                 file_ignore_patterns = { ".git/", "node_modules" },
--                 -- preview = false,
--                 mappings = {
--                     i = {
--                         ["<C-y>"] = actions.select_default,
--                     },
--                 },
--             },
--             pickers = {
--                 find_files = {
--                     path_display = { "truncate" },
--                     hidden = true,
--                 },
--             },
--         })
--
--         telescope.load_extension("fzf")
--
--         local keymap = vim.keymap
--         keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
--         keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Find commands" })
--         keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Find diagnostics" })
--         keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
--         keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find text" })
--         keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help" })
--         keymap.set("n", "<leader>fl", "<cmd>Telescope loclist<cr>", { desc = "Find loclist" })
--         keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", { desc = "Find quickfix" })
--         keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = "Find references" })
--         keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find document symbols" })
--     end,
-- }
