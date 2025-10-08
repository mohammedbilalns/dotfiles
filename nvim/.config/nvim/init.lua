
-- Lazy configuration 
local vim = vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", 
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
vim.cmd [[set nomodeline]]
require("vim-options")
require("lazy").setup("plugins") -- load lazy plugins from lua/plugins 
