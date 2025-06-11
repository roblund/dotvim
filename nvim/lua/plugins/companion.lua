return {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "ravitemer/codecompanion-history.nvim",
    },
    config = function()
        require("codecompanion").setup({
            adapters = {
                copilot = function()
                    return require("codecompanion.adapters").extend("copilot", {
                        schema = {
                            model = {
                                default = "claude-sonnet-4",
                            },
                        },
                    })
                end,
            },
            extensions = {
                history = {
                    enabled = true,
                },
            },
        })

        vim.keymap.set(
            { "n", "v" },
            "<C-a>",
            "<cmd>CodeCompanionActions<cr>",
            { noremap = true, silent = true, desc = "Open CodeCompanion Actions Palette" }
        )
        vim.keymap.set(
            { "n", "v" },
            "<Leader>a",
            "<cmd>CodeCompanionChat Toggle<cr>",
            { noremap = true, silent = true, desc = "Toggle CodeCompanion Chat" }
        )
        vim.keymap.set(
            "v",
            "ga",
            "<cmd>CodeCompanionChat Add<cr>",
            { noremap = true, silent = true, desc = "Add current selection to CodeCompanion Chat" }
        )

        -- Expand 'cc ' into 'CodeCompanion' in the command line
        vim.cmd([[cab cc CodeCompanion]])
    end,
}
