_G.vim = vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({"git", "clone", "https://github.com/folke/lazy.nvim.git", lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = "plugins",
	ui = { border = "single" },
})

vim.lsp.enable({ "clangd", "rust_analyzer", "lua_ls" })
vim.lsp.config( "*", { root_markers = { ".git" }})

vim.keymap.set({"n", "v", "i", "t"}, "<C-Q>", function() vim.cmd([[wa!]]) vim.cmd([[qa!]]) end)
vim.keymap.set("n", "<C-c>", function() pcall(vim.cmd, [[w!]]) vim.cmd([[bd!]]) vim.cmd([[bnext]]) end)
vim.keymap.set("n", "<Esc>", function() vim.cmd([[nohlsearch]]) end)
vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set("n", "<C-h>", function() vim.cmd([[wincmd h]]) end)
vim.keymap.set("n", "<C-j>", function() vim.cmd([[wincmd j]]) end)
vim.keymap.set("n", "<C-k>", function() vim.cmd([[wincmd k]]) end)
vim.keymap.set("n", "<C-l>", function() vim.cmd([[wincmd l]]) end)
vim.keymap.set("n", "<C-P>", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<C-P>", [["hy:%s/<C-r>h/<C-r>h/gI<Left><Left><Left>]])
vim.keymap.set("n", "<C-\\>", vim.diagnostic.open_float)

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.shiftround = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.fillchars = "eob: "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 0
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.laststatus = 3
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.shortmess:append("I")
vim.o.winborder = "single"

vim.diagnostic.config {
	virtual_text = true,
	update_in_insert = true,
}

vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#4F5258", bg = "NONE" })
vim.api.nvim_set_hl(0, "FzfLuaBorder", { fg = "#4F5258", bg = "NONE" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#4F5258", bg = "NONE" })
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#4F5258", bg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
