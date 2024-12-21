return {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("nord").setup({
            transparent = true,
            on_highlights = function(highlights, colors)
                local utils = require("nord.utils")
                local alpha = 0.1
                highlights.DiffAdd = { bg = utils.blend(colors.aurora.green, colors.polar_night.origin, alpha) }
                highlights.DiffText =
                    { bg = utils.blend(colors.aurora.yellow, colors.polar_night.origin, alpha + 0.10) }
                highlights.DiffChange = { bg = utils.blend(colors.aurora.yellow, colors.polar_night.origin, alpha) }
                highlights.DiffDelete = { bg = utils.blend(colors.aurora.red, colors.polar_night.origin, alpha) }
            end,
        })
        vim.cmd.colorscheme("nord")
    end,
}
