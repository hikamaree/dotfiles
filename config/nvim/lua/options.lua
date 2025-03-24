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

vim.diagnostic.config {
	update_in_insert = true,
	float = { focusable = false, border = "single", header = "", prefix = "" },
}

local border_fg = vim.api.nvim_get_hl(0, { name = "NonText" }).fg
vim.tbl_map(function(group) vim.api.nvim_set_hl(0, group, { fg = border_fg, bg = "NONE" }) end, { "FloatBorder", "FzfLuaBorder", "WinSeparator", "VertSplit" })
vim.tbl_map(function(group) vim.api.nvim_set_hl(0, group, { bg = "NONE" }) end, { "Pmenu", "Normal", "StatusLine", "NormalFloat" })

vim.api.nvim_create_autocmd({"WinEnter", "BufWinEnter"}, { callback = function() vim.opt_local.cursorline = true end })
vim.api.nvim_create_autocmd("WinLeave", { callback = function() vim.opt_local.cursorline = false end })

vim.schedule(function()
	local arg = vim.fn.argv(0)
	if vim.fn.isdirectory(arg) == 1 then
		vim.cmd("cd " .. arg .. " | bwipeout!")
	end
end)
