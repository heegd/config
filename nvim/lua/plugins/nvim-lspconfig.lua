return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "SmiteshP/nvim-navic",
      "akinsho/flutter-tools.nvim",
    },
    config = function()
      local nvim_lsp = require("lspconfig")
      local navic = require("nvim-navic")

      local on_attach = function(client, bufnr)
        navic.attach(client, bufnr)

        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        local opts = { noremap = true, silent = true }
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format { async = true } end, bufopts)
        vim.keymap.set("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", opts)
        vim.keymap.set("n", "<leader>lo", ":SymbolsOutline<cr>")
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<leader>lR", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        --vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
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

      -- Need to add cmd to the call for windows
      local python_lsp_call = "pyright-langserver"
      if (vim.fn.has("win32") == 1)
      then
        python_lsp_call = python_lsp_call .. ".cmd"
      end
      require("lspconfig")["pyright"].setup {
        cmd = { python_lsp_call, "--stdio" },
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
      -- Need to add cmd to the call for windows
      local json_lsp_call = "vscode-json-language-server"
      if (vim.fn.has("win32") == 1)
      then
        json_lsp_call = json_lsp_call .. ".cmd"
      end

      nvim_lsp.jsonls.setup {
        filetypes = { "json" },
        cmd = { json_lsp_call, "--stdio" },
        on_attach = on_attach,
        init_options = {
          provideFormatter = true,
        },
        single_file_support = true,
        capabilities = capabilities,
      }

      nvim_lsp.powershell_es.setup {
        bundle_path = "C:/Tools/PowerShellEditorServices",
        on_attach = on_attach,
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
}
