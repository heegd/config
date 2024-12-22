return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "arkav/lualine-lsp-progress",
  },
  config = function()
    local lualine = require("lualine")

    local filename = {
      "filename",
      file_status = true, -- (readonly status, modified status)
      path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
    }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " ", hint = " " },
      colored = false,
      always_visible = false,
    }

    local location = {
      "location",
      padding = 0,
    }

    local function working_directory()
      return vim.fn.getcwd()
    end

    local function unsaved_buffers()
      local buffers = vim.fn.getbufinfo()
      local buffer_count = 0
      local unsaved_buffer_count = 0

      for _, buffer in ipairs(buffers) do
        if buffer["listed"] == 1 then
          buffer_count = buffer_count + 1

          if buffer["changed"] == 1 then
            unsaved_buffer_count = unsaved_buffer_count + 1
          end
        end
      end

      return " " .. buffer_count .. "   " .. unsaved_buffer_count
    end

    lualine.setup({
      options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "nord",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { working_directory },
        lualine_c = { "branch", "lsp_progress" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { unsaved_buffers },
      },
      winbar = {
        lualine_a = { location, "progress" },
        lualine_b = { "filetype" },
        lualine_c = { filename },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { diagnostics },
      },
      inactive_winbar = {
        lualine_a = { location, "progress" },
        lualine_b = { "filetype" },
        lualine_c = { filename },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { diagnostics },
      },
    })
  end,
}
