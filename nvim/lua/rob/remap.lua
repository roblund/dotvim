vim.g.mapleader = " "

vim.keymap.set("n", "j", "gj", { desc = "move down by display line, including wrapped lines" })
vim.keymap.set("n", "k", "gk", { desc = "move up by display line, including wrapped lines" })
vim.keymap.set("n", "-", vim.cmd.Ex, { desc = "open netrw file browser" })
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>q", vim.cmd.close)
vim.keymap.set("n", "<leader>h", vim.cmd.nohl)
vim.keymap.set("n", "<leader>t", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>d", "<cmd>w !diff % -<cr>", { desc = "Diff the current unsaved changes" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "yank to the system copy-paste buffer" })

vim.keymap.set("v", "<", "<gv", { desc = "outdent and keep visual selection" })
vim.keymap.set("v", ">", ">gv", { desc = "indent and keep visual selection" })

vim.keymap.set("n", "gV", "`[v`]", { desc = "select the thing you just pasted" })
vim.keymap.set("v", "y", "ygv<ESC>", { desc = "ygv<ESC> - yank but don't move cursor back to start of selection" })

vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist, { desc = "send diagnostic messages to the quickfix list" })

vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
