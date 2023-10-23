return {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
    config = function()
        -- require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
        require('hop').setup()
        vim.keymap.set("n", "s", vim.cmd.HopWord)
        vim.keymap.set("v", "s", vim.cmd.HopWord)
    end
}
