return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",

	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{
			-- Optional
			"williamboman/mason.nvim",
			build = function()
				pcall(vim.cmd, "MasonUpdate")
			end,
		},
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "L3MON4D3/LuaSnip" }, -- Required
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	},
	config = function()
		local lsp = require("lsp-zero").preset({})

		lsp.on_attach(function(client, bufnr)
			lsp.default_keymaps({ buffer = bufnr })
		end)

		vim.lsp.config("lua_ls").setup(lsp.nvim_lua_ls())

		vim.lsp.config("ts_ls").setup({
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
						languages = { "javascript", "typescript", "vue" },
					},
				},
			},
			filetypes = {
				"javascript",
				"typescript",
				"vue",
			},
		})

		lsp.setup()

		local cmp = require("cmp")
		cmp.setup({
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			},
			completion = {
				keyword_length = 2,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{
					name = "buffer",
					keyword_length = 2,
					max_item_count = 7,
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

		vim.keymap.set("n", "<leader>v", function()
			vim.cmd("vsplit")
			vim.lsp.buf.definition()
		end, { desc = "Goto definition in new vertical split" })
	end,
}
