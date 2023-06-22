return {
    "MunifTanjim/prettier.nvim",
    config = function()
        local prettier = require("prettier")

        prettier.setup({
            bin = 'prettierd',
            filetypes = {
                "css",
                "graphql",
                "html",
                "javascript",
                "javascriptreact",
                "json",
                "less",
                "markdown",
                "scss",
                "typescript",
                "typescriptreact",
                "yaml",
                "vue",
            },
        })
    end
}
