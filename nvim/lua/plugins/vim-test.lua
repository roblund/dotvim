return {
    "vim-test/vim-test",
    config = function ()
        vim.keymap.set("n", "<leader>0", vim.cmd.TestNearest)
        vim.keymap.set("n", "<leader>9", vim.cmd.TestFile)
    end
}
