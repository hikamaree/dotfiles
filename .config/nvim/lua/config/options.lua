---@diagnostic disable
local cmd = vim.cmd
local opt = vim.opt
local fn = vim.fn
local diagnostic = vim.diagnostic
---@diagnostic enable

opt.backspace = {"eol", "start", "indent"}
opt.clipboard = "unnamedplus"
opt.encoding = "utf-8"
opt.syntax = "enable"
local indent = 4
opt.autoindent = true
opt.expandtab = false
opt.shiftwidth = indent
opt.smartindent = true
opt.softtabstop = indent
opt.tabstop = indent
opt.shiftround = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.wildmenu = false
opt.cursorline = true
opt.laststatus = 2
opt.lazyredraw = true
opt.list = true
opt.listchars = {
	tab = "  ",
	trail = "·",
	extends = "»",
	precedes = "«",
	nbsp = "×",
}
opt.fillchars='eob: '
opt.cmdheight = 0
opt.pumheight = 10
opt.mouse = "a"
opt.number = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.wrap = false
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.showmode = false
opt.history = 100
opt.redrawtime = 1500
opt.timeoutlen = 250
opt.ttimeoutlen = 10
opt.updatetime = 100
opt.termguicolors = true
opt.undofile = true
opt.undodir = fn.stdpath("data") .. "/undo"
opt.undolevels = 1000
opt.undoreload = 10000
opt.foldmethod = "marker"
opt.foldlevel = 99
opt.guicursor = "n-v-i-c:iCursor,i:ver100-iCursor,n-v-c:hor20-iCursor"

cmd "colorscheme tokyonight-night"

diagnostic.config {
	virtual_text = {
		prefix = require("config.icons").misc.error,
	},
}
for type, icon in pairs(require("config.icons").diagnostics) do
	local hl = "DiagnosticSign" .. type
	fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
