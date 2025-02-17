return {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
    config = function()
        -- require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
        require('hop').setup()
        vim.keymap.set("n", "s", vim.cmd.HopWord)
        vim.keymap.set("v", "s", vim.cmd.HopWord)
        vim.keymap.set("n", "S", vim.cmd.HopChar1)
        vim.keymap.set("v", "S", vim.cmd.HopChar1)
        vim.keymap.set("n", "<leader>s", vim.cmd.HopLineStart)
        vim.keymap.set("v", "<leader>s", vim.cmd.HopLineStart)
    end
}
