return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-jest",
    },
    config = function()
        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("neotest-jest"),
            },
            icons = {
                passed = "P",
                failed = "F",
                running = ">",
                skipped = "#",
                unknown = "?",
            },
            quickfix = {
                open = false
            },
        })
        vim.keymap.set("n", "<leader>0", function()
            require("neotest").run.run()
        end, { desc = "Test nearest test" })
        vim.keymap.set("n", "<leader>9", function()
            require("neotest").run.run(vim.fn.expand("%"))
        end, { desc = "Test this file" })
        vim.keymap.set("n", "<leader>8", function()
            require("neotest").output.open({ enter = false })
        end, { desc = "Open the test output" })
    end
}
