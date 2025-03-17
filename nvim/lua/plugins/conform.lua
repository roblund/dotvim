return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            log_level = vim.log.levels.DEBUG,
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "gofmt", "goimports", "golines" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                yaml = { "yamlfmt" },
                json = { "deno_fmt" },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
    end,
}
