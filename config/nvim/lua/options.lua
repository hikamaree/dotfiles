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
vim.opt.guicursor = "n-v-i-c:iCursor,i:ver100-iCursor,n-v-c:hor20-iCursor"
vim.opt.shortmess:append("I")
vim.o.winborder = "single"

vim.diagnostic.config {
	virtual_text = true,
	update_in_insert = true,
	float = { focusable = false, border = "single", header = "", prefix = "" },
}

local border_fg = vim.api.nvim_get_hl(0, { name = "NonText" }).fg
vim.api.nvim_set_hl(0, "FloatBorder", { fg = border_fg, bg = "NONE" })
vim.api.nvim_set_hl(0, "FzfLuaBorder", { fg = border_fg, bg = "NONE" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = border_fg, bg = "NONE" })
vim.api.nvim_set_hl(0, "VertSplit", { fg = border_fg, bg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })

vim.api.nvim_create_autocmd({"WinEnter", "BufWinEnter"}, { callback = function() vim.opt_local.cursorline = true end })
vim.api.nvim_create_autocmd("WinLeave", { callback = function() vim.opt_local.cursorline = false end })
