return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local actions = require("telescope.actions")
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<C-P>', builtin.find_files)
        vim.keymap.set('n', "<leader>b", builtin.buffers, { desc = "Current buffers" })
        vim.keymap.set('n', "<leader>ht", builtin.help_tags, { desc = "Help tags" })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Find in project (grep)" })
        vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, { desc = "Find in current buffer" })
        vim.keymap.set('n', '<leader>ff', builtin.treesitter, { desc = "Find function in current buffer" })
        vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = "Resume the last picker where you left off" })
        vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = "Send all results to quickfix" })
        vim.keymap.set("n", "<leader>fw", function()
            require("telescope.builtin").grep_string({ additional_args = { "--hidden" } })
        end, { desc = "[F]ind [W]ord (telescope)" })
        vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = "Find references for item under cursor" })
        vim.keymap.set("n", "<leader>km", builtin.keymaps, { desc = "Key maps" })

        require('telescope').setup({
            defaults = {
                layout_config = {
                    prompt_position = "top",
                },
                sorting_strategy = "ascending",
                mappings = {
                    i = {
                        ["<C-Q>"] = actions.send_to_qflist + actions.open_qflist,
                        ["<C-j>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
                        ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
                    },
                },
            },
            pickers = {
                lsp_references = {
                    theme = "ivy",
                    show_line = false,
                },
                buffers = {
                    theme = "ivy",
                },
                current_buffer_fuzzy_find = {
                    theme = "ivy",
                },
                treesitter = {
                    theme = "ivy",
                },
                cache_picker = {
                    num_pickers = 2
                },
            },
        })
    end
}
