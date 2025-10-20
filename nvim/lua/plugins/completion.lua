return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				completion = {
					keyword_length = 2,
				},
				mapping = {
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true, -- Automatically select the first item
					}),
				},
				preselect = cmp.PreselectMode.Item,
				sources = {
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "nvim_lsp_signature_help" },
					{
						name = "buffer",
						keyword_length = 2,
						max_item_count = 5,
						option = {
							-- allow completion of words in visible windows, not just current buffer
							get_bufnrs = function()
								local bufs = {}
								for _, win in ipairs(vim.api.nvim_list_wins()) do
									bufs[vim.api.nvim_win_get_buf(win)] = true
								end
								return vim.tbl_keys(bufs)
							end,
						},
					},
				},
			})
		end,
	},
}
