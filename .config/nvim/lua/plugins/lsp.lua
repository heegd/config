return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "akinsho/flutter-tools.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup({
      pip = { upgrade_pip = true },
    })

    require("mason-lspconfig").setup({
      automatic_installation = true,
    })

    local nvim_lsp = require("lspconfig")

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

    -- dartls is set up through flutter-tools.nvim
    require("flutter-tools").setup({
      ui = { border = "rounded" },
      lsp = {
        capabilities = capabilities,
      },
    })

    require("lspconfig")["pyright"].setup({
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            autoImportCompletions = true,
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            typeCheckingMode = "off",
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    nvim_lsp.jsonls.setup({
      init_options = {
        provideFormatter = true,
      },
      single_file_support = true,
      capabilities = capabilities,
    })

    nvim_lsp.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    })

    nvim_lsp.html.setup({
      capabilities = capabilities,
    })

    nvim_lsp.marksman.setup({
      capabilities = capabilities,
    })
  end,
}
