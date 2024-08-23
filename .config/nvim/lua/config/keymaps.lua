---@diagnostic disable
local vim = vim
local keymap = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
---@diagnostic enable

keymap({"n", "v", "i", "t"}, "<C-q>", [[<CMD>lua require("FTerm").exit()<CR><CMD>wa!<CR><CMD>qa!<CR>]])
keymap("n", "<C-s>", "<CMD>wa!<CR>")

keymap("n", "<C-c>", [[<CMD>w<CR><CMD>bd<CR><CMD>bnext<CR>]])
keymap("n", "<C-TAB>", [[<CMD>bnext<CR>]])
keymap("n", "<C-S-TAB>", [[<CMD>bprev<CR>]])

keymap("n", "<C-Left>", [[<C-w>h]])
keymap("n", "<C-Right>", [[<C-w>l]])
keymap("n", "<C-Down>", [[<C-w>j]])
keymap("n", "<C-Up>", [[<C-w>k]])

keymap("x", "<A-Up>", [[:move '<-2<CR>gv-gv]])
keymap("x", "<A-Down>", [[:move '>+1<CR>gv-gv]])

keymap("n", "<C-p>", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap("n", "<C-Enter>", [[<CMD>lua require("FTerm").toggle()<CR>]])
keymap("t", "<Esc>", [[<CMD>lua require("FTerm").toggle()<CR>]])

keymap("n", "<C-l>", [[<CMD>FzfLua resume=true header=false<CR>]])
keymap("n", "<C- >", [[<CMD>FzfLua files resume=true header=false<CR>]])
keymap("n", "<C-d>", [[<CMD>FzfLua lsp_workspace_diagnostics resume=true header=false<CR>]])
keymap("n", "<C-g>", [[<CMD>FzfLua live_grep resume=true header=false<CR>]])
keymap("n", "<C-S-g>", [[<CMD>FzfLua git_status resume=true header=false<CR>]])

keymap("n", "<C-/>", vim.diagnostic.open_float)

keymap('n', '<C-n>', function()
	local initial_path = vim.fn.expand('%:p:h') .. '/'
	local file = vim.fn.input('Create: ', initial_path)
	if file ~= "" then
		local dir = vim.fn.fnamemodify(file, ":h")
		vim.fn.mkdir(dir, "p")
		if vim.fn.fnamemodify(file, ":t") ~= "" then
			vim.cmd('e ' .. file)
			vim.cmd('w')
		end
	end
end)

keymap('n', '<C-x>', function()
	local current_path = vim.fn.expand('%:p')
	local path_to_delete = vim.fn.input('Delete: ', current_path)
	if path_to_delete ~= "" then
		if vim.fn.isdirectory(path_to_delete) then
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				local buf_name = vim.fn.expand(vim.api.nvim_buf_get_name(buf))
				if vim.startswith(buf_name, path_to_delete) then
					if #vim.api.nvim_list_bufs() == 1 then
						vim.cmd('enew')
					end
					vim.cmd('bd! ' .. buf)
				end
			end
			vim.fn.delete(path_to_delete, 'rf')
		else
			local buf = vim.fn.bufnr(path_to_delete)
			if buf ~= -1 then
				vim.cmd('bd! ' .. buf)
			end
			vim.fn.delete(path_to_delete)
		end
	end
end)

keymap("n", "<C-f>", function()
	vim.lsp.buf.code_action({
		filter = function(a) return a.isPreferred end,
		apply = true
	})
end)
keymap("n", "<C-r>", vim.lsp.buf.rename)

autocmd("VimEnter", {
	callback = function()
		local arg = vim.fn.argv(0)
		if vim.fn.isdirectory(arg) == 1 then
			vim.cmd("cd " .. arg)
			vim.cmd("bwipeout!")
		end
	end,
})
