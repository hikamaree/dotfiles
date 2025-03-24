_G.vim = vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({"git", "clone", "https://github.com/folke/lazy.nvim.git", lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = "plugins",
	performance = { rtp = { disabled_plugins = {
			"gzip", "matchit", "matchparen", "netrwPlugin", "rplugin",
			"tarPlugin", "tohtml", "tutor", "zipPlugin", "osc52", "spellfile"
	}}},
	ui = { border = "single" },
})

require("options")
require("keymaps")
