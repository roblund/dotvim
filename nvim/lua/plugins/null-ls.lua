return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
        { "MunifTanjim/prettier.nvim" },
    },
    config = function()
        local null_ls = require("null-ls")
        local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })

        null_ls.setup({
            on_attach = function(client, bufnr)
                if client.server_capabilities.documentFormattingProvider then
                    -- format on save
                    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
                    vim.api.nvim_create_autocmd("BufWritePost", {
                            buffer = bufnr,
                            group = group,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr, async = false })
                            end,
                            desc = "[lsp] format on save",
                        })
                end
            end,
        })

        local prettier = require('prettier')
        prettier.setup {
          bin = 'prettier',
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
          }
        }
    end
}
