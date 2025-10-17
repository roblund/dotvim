local on_attach = function(_, bufnr)
	vim.keymap.set("n", "grt", function()
		vim.lsp.buf.type_definition()
	end, { desc = "Goto Type Definition", buffer = bufnr, noremap = true, silent = true })

	vim.keymap.set("n", "<leader>q", function()
		vim.diagnostic.setloclist()
	end, { desc = "Open diagnostics in quickfix", buffer = bufnr, noremap = true, silent = true })
	vim.keymap.set("n", "<leader>v", function()
		vim.cmd("vsplit")
		vim.lsp.buf.definition()
	end, { desc = "Goto definition in new vertical split", buffer = bufnr, noremap = true, silent = true })
end

vim.lsp.config("*", {
	root_markers = { ".git" },
})

-- TypeScript/JavaScript
vim.lsp.config("ts_ls", {
	on_attach = on_attach,
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})
vim.lsp.enable("ts_ls")

-- Lua
vim.lsp.config("lua_ls", {
	on_attach = on_attach,
})
vim.lsp.enable("lua_ls")
