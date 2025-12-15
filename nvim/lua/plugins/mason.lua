return {
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "vue_ls" },
			})

			-- Ensure mason's bin directory is in PATH
			local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
			vim.env.PATH = mason_bin .. ":" .. vim.env.PATH
		end,
	},
}
