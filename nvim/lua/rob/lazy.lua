local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local opts = {
	change_detection = {
		-- don't auto reload modules when changes are detected. it just freezes nvim.
		enabled = false,
	},
}

-- load everything in the plugins directory
require("lazy").setup("plugins", opts)
