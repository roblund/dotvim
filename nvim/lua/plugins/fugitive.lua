return {
    "tpope/vim-fugitive",
    config = function ()
        vim.keymap.set("n", "<leader>gs", vim.cmd.G)
        vim.keymap.set("n", "<leader>gf", "<cmd>diffget //3<CR>")
        vim.keymap.set("n", "<leader>gj", "<cmd>diffget //2<CR>")
        vim.keymap.set("n", "<leader>gb", vim.cmd.GBrowse)
    end
}
