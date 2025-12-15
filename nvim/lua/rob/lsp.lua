local on_attach = function(_, bufnr)
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, { desc = "Goto Definition", buffer = bufnr, noremap = true, silent = true })

	vim.keymap.set("n", "grt", function()
		vim.lsp.buf.type_definition()
	end, { desc = "Goto Type Definition", buffer = bufnr, noremap = true, silent = true })

	vim.keymap.set("n", "grr", function()
		require("telescope.builtin").lsp_references()
	end, { desc = "LSP References for word under cursor", buffer = bufnr, noremap = true, silent = true })

	vim.keymap.set("n", "<leader>q", function()
		vim.diagnostic.setloclist()
	end, { desc = "Open diagnostics in quickfix", buffer = bufnr, noremap = true, silent = true })

	vim.keymap.set("n", "<leader>v", function()
		vim.cmd("vsplit")
		vim.lsp.buf.definition()
	end, { desc = "Goto definition in new vertical split", buffer = bufnr, noremap = true, silent = true })
end

vim.lsp.config("*", {
	root_markers = { "package.json", ".git" },
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

local vue_language_server_path = vim.fn.expand("$MASON/packages")
	.. "/vue-language-server"
	.. "/node_modules/@vue/language-server"
local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}
local vtsls_config = {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
	},
	filetypes = tsserver_filetypes,
}

local ts_ls_config = {
	init_options = {
		plugins = {
			vue_plugin,
		},
	},
	on_attach = on_attach,
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = tsserver_filetypes,
}

-- If you are on most recent `nvim-lspconfig`
local vue_ls_config = {
	on_attach = on_attach,
	cmd = { "vue-language-server", "--stdio" },
	filetypes = { "vue" },
}
vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("vue_ls", vue_ls_config)
vim.lsp.config("ts_ls", ts_ls_config)
vim.lsp.enable({ "vtsls", "ts_ls", "vue_ls" })
