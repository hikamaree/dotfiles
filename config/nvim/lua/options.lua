vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.shiftround = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.fillchars = "eob: "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 0
vim.opt.pumheight = 10
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.laststatus = 3
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.guicursor = "n-v-i-c:iCursor,i:ver100-iCursor,n-v-c:hor20-iCursor"
vim.opt.shortmess:append("I")
vim.cmd.colorscheme "tokyonight"
vim.diagnostic.config {
	update_in_insert = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "single",
		header = "",
		prefix = "",
	},
}
vim.schedule( function ()
	local arg = vim.fn.argv(0)
	if vim.fn.isdirectory(arg) == 1 then
		vim.cmd("cd " .. arg)
		vim.cmd("bwipeout!")
	end
end)
vim.api.nvim_create_autocmd({"WinEnter", "BufWinEnter"}, {
  callback = function()
    vim.opt_local.cursorline = true
  end,
})
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    vim.opt_local.cursorline = false
  end,
})
