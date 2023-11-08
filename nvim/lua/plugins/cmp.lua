return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",           -- Buffer completions
      "hrsh7th/cmp-path",             -- Path completions
      "L3MON4D3/LuaSnip",             -- Snippet engine
      "saadparwaiz1/cmp_luasnip",     -- Snippet completions
      "rafamadriz/friendly-snippets", -- Premade snippets
      "onsails/lspkind.nvim",         -- vs-code like pictograms
      "hrsh7th/cmp-nvim-lsp",         -- LSP completions
      "hrsh7th/cmp-nvim-lsp-signature-help"
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      -- Snippet sources
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })
      luasnip.filetype_extend("dart", { "flutter" })
      -- Associate pydoc snippets with the python language. I wonder if this is a bug in friendly-snippets?
      luasnip.filetype_extend("python", { "pydoc" })

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-y>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Insert, select = true },
          ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
        }),
        formatting = {
          format = lspkind.cmp_format({
            maxsidth = 50,
            ellipsis_char = "..."
          }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "nvim_lsp_signature_help" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        experimental = {
          native_menu = false,
          ghost_text = true
        },
      })

      local keymap = vim.keymap
      keymap.set({ "i" }, "<C-S>e", function() luasnip.expand() end, { silent = true, desc = "Snippet expand" })
      keymap.set({ "i", "s" }, "<C-S>n", function() luasnip.jump(1) end, { silent = true, desc = "Snippet next" })
      keymap.set({ "i", "s" }, "<C-S>p", function() luasnip.jump(-1) end, { silent = true, desc = "Snippet previious" })
      keymap.set({ "i", "s" }, "<C-S>c", function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end, { silent = true, desc = "Snippet choice" })
    end
  }
}
