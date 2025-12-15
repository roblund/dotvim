require("rob.remap")
require("rob.lazy")
require("rob.set")
require("rob.statusline")

-- Load LSP config after all plugins are loaded
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("rob.lsp")
	end,
})
