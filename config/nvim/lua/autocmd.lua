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

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "term://*",
	callback = function()
		vim.cmd("startinsert")
	end,
})
