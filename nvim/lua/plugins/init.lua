return {
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
		opts = {},
		lazy = false,
		config = function()
			require("oil").setup()
			vim.keymap.set("n", "-", function()
				vim.cmd("Oil")
			end, { desc = "Open parent directory" })
		end,
	},
}
