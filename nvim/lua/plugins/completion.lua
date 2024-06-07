return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      "hrsh7th/cmp-buffer",       -- Buffer completions
      "hrsh7th/cmp-path",         -- Path completions
      "L3MON4D3/LuaSnip",         -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completions
      "onsails/lspkind.nvim",     -- vs-code like pictograms
      "hrsh7th/cmp-nvim-lsp",     -- LSP completions
      "hrsh7th/cmp-nvim-lsp-signature-help"
    },
    config = function()
      local lspkind = require("lspkind")
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        sources = {
          { name = "buffer" },
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lua" },
          { name = "path" },
        },
        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-y>"] = cmp.mapping(
            cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            },
            { "i", "c" }
          ),
        },
        formatting = {
          format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
            show_labelDetails = true
          }),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        experimental = {
          ghost_text = true
        },
      })

      local keymap = vim.keymap
      keymap.set({ "i" }, "<C-S>e", function() luasnip.expand() end, { silent = true, desc = "Snippet expand" })
      keymap.set({ "i", "s" }, "<C-S>n", function() luasnip.jump(1) end, { silent = true, desc = "Snippet next" })
      keymap.set({ "i", "s" }, "<C-S>p", function() luasnip.jump(-1) end, { silent = true, desc = "Snippet previous" })
      keymap.set({ "i", "s" }, "<C-S>c", function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end, { silent = true, desc = "Snippet choice" })
    end
  }
}
