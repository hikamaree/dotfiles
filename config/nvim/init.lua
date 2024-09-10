_G.vim = vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({"git", "clone", "https://github.com/folke/lazy.nvim.git", lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	root = vim.fn.stdpath("data") .. "/lazy",
	spec = { import = "plugins" },
	lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
	defaults = {
		lazy = false,
		version = false
	},
	rocks = { hererocks = true },
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
	ui = { border = "single" },
	checker = { enabled = false },
	change_detection = { enabled = false },
})

require("options")
require("keymaps")
