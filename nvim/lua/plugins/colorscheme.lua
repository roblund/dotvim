return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 999,
        opts = {},
        config = function()
            require("tokyonight").setup({
                on_colors = function(c)
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

            vim.opt.termguicolors = true
            vim.cmd.colorscheme('tokyonight')
        end
    },
}
