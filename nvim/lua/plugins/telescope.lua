return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<C-P>', builtin.find_files)
        --vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        -- vim.keymap.set('n', '<leader>ps', function()
        --     builtin.grep_string({ search = vim.fn.input("Grep > ") });
        -- end)
        vim.keymap.set('n', "<leader>b", builtin.buffers)
        vim.keymap.set('n', "<leader>ht", builtin.help_tags)
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set('n', '<leader>ff', builtin.treesitter, {})

        require('telescope').setup({
            defaults = {
                layout_config = {
                    prompt_position = "top",
                },
                sorting_strategy = "ascending",
            }
        })
    end
}
