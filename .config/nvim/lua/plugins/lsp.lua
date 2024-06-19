return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "akinsho/flutter-tools.nvim",
    "SmiteshP/nvim-navic"
  },
  config = function()
    local nvim_lsp = require("lspconfig")
    local navic = require("nvim-navic")

    local on_attach = function(client, bufnr)
      navic.attach(client, bufnr)
      vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
      vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { buffer = 0 })

      vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = 0 })
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = 0 })
      vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { buffer = 0 })
    end

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- dartls is set up through flutter-tools.nvim
    require("flutter-tools").setup {
      ui = { border = "rounded", },
      lsp = {
        on_attach = on_attach,
        capabilities = capabilities
      }
    }

    require("lspconfig")["pyright"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            autoImportCompletions = true,
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            typeCheckingMode = "off",
            useLibraryCodeForTypes = true,
          }
        }
      }
    }

    --[[ local util = require "lspconfig.util"
      require("lspconfig")["pylsp"].setup{
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                enabled = false
              },
              mccabe = {
                enabled = false
              },
              pyflakes = {
                enabled = false
              },
              flake8 = {
                enabled = true
              }
            }
          },
        },
        root_dir = function(fname)
          return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
            util.path.dirname(fname)
          end,
      } ]]

    nvim_lsp.jsonls.setup {
      on_attach = on_attach,
      init_options = {
        provideFormatter = true,
      },
      single_file_support = true,
      capabilities = capabilities,
    }

    nvim_lsp.lua_ls.setup {
      on_attach = on_attach,
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
    }

    nvim_lsp.html.setup {
      capabilities = capabilities,
      on_attach = on_attach
    }

    nvim_lsp.marksman.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    nvim_lsp.tsserver.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end
}
