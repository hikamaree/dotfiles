---@diagnostic disable
local vim = vim
---@diagnostic enable

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({"git", "clone", "https://github.com/folke/lazy.nvim.git", lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	root = vim.fn.stdpath("data") .. "/lazy",
	spec = { import = "plugins" } ,
	lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
	defaults = {
		lazy = false,
		version = nil
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	ui = {
		border = "rounded"
	}
})

require("config.options")
require("config.keymaps")
