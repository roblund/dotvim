return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 999,
        opts = {},
        config = function()
            require("tokyonight").setup({
                style = "night",
                on_colors = function(c)
                    c.bg = "#000000"
                    c.comment = "#6F90C2"
                end,
                on_highlights = function(hl, c)
                    hl.LineNr = {
                        fg = "#505C6D",
                    }
                    hl.TabLine = {
                        fg = c.cyan
                    }
                    hl.StatusLine = {
                        fg = "#d5d6db",
                        bg = c.blue7,
                    }
                    hl.StatusLineNC = {
                        fg = c.green1
                    }
                end
            })

            vim.opt.background = "dark"
            vim.cmd([[colorscheme tokyonight-night]])
        end
    },
}
