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

vim.lsp.enable({ "clangd", "rust_analyzer", "lua_ls" })
vim.lsp.config('*', {
	capabilities = require('blink.cmp').get_lsp_capabilities(),
	on_attach = function()
		vim.keymap.set("n", "gr", [[<CMD>FzfLua lsp_references resume=true header=false<CR>]])
		vim.keymap.set("n", "wd", [[<CMD>FzfLua lsp_workspace_diagnostics resume=true header=false<CR>]])
		vim.keymap.set("n", "ca", [[<CMD>FzfLua lsp_code_actions resume=true header=false<CR>]])
		vim.keymap.set("n", "gd", vim.lsp.buf.definition)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
		vim.keymap.set("n", "<C-r>", vim.lsp.buf.rename)
	end,
	root_markers = { '.git' },
})

require("options")
require("keymaps")
