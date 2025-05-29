return {
	-- { "JoosepAlviste/nvim-ts-context-commentstring" },
	-- {
	--     "numToStr/Comment.nvim",
	--     dependencies = {
	--         "JoosepAlviste/nvim-ts-context-commentstring",
	--         "nvim-treesitter/nvim-treesitter",
	--     },
	--     config = function()
	--         require("Comment").setup({
	--             pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
	--             -- pre_hook = require('ts_context_commentstring.internal').calculate_commentstring,
	--         })
	--         require('nvim-ts-context-commentstring').setup({
	--             enable_autocmd = true,
	--         })
	--     end,
	-- },
	-- {
	--     'numToStr/Comment.nvim',
	--     config = function()
	--         require('Comment').setup {
	--             pre_hook = function()
	--                 return vim.bo.commentstring
	--             end
	--         }
	--     end,
	--     lazy = false,
	--     dependencies = {
	--         "JoosepAlviste/nvim-ts-context-commentstring",
	--         'nvim-treesitter/nvim-treesitter',
	--     }
	-- },
	{ "leafOfTree/vim-vue-plugin" },
	{ "tpope/vim-unimpaired" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-rhubarb" },
	{
		"karb94/neoscroll.nvim",
		opts = {},
		config = function()
			require("neoscroll").setup({
				duration_multiplier = 0.5,
			})
		end,
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		lazy = false,
		config = function()
			require("oil").setup()
			vim.keymap.set("n", "-", function()
				vim.cmd("Oil")
			end, { desc = "Open parent directory" })
		end,
	},
}
