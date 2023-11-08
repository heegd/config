return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      local toggleterm = require("toggleterm")

      toggleterm.setup({
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
        size = 25,
      })

      local keymap = vim.keymap
      keymap.set("t", "<C-[>", "<C-\\><C-n>", {desc = "Escape"})
      keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", {desc = "Toggle terminal"})
      keymap.set("n", "<leader>ts", "<cmd>ToggleTermSendCurrentLine<cr>", {desc = "Send line to terminal"})
      keymap.set("v", "<leader>ts", ":ToggleTermSendVisualSelection<cr>", {desc = "Send selection to terminal"})
      keymap.set("x", "<leader>ts", ":ToggleTermSendVisualSelection<cr>", {desc = "Send selection to termainl"})
    end
  }
}
