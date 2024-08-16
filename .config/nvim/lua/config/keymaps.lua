---@diagnostic disable
local vim = vim
local api = vim.api
local cmd = vim.cmd
local fn = vim.fn
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
keymap("t", "<Esc>", [[<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>]])

keymap("n", "<C-l>", [[<CMD>FzfLua resume=true header=false<CR>]])
keymap("n", "<C- >", [[<CMD>FzfLua files resume=true header=false<CR>]])
keymap("n", "<C-d>", [[<CMD>FzfLua lsp_workspace_diagnostics resume=true header=false<CR>]])
keymap("n", "<C-g>", [[<CMD>FzfLua live_grep resume=true header=false<CR>]])
keymap("n", "<C-S-g>", [[<CMD>FzfLua git_status resume=true header=false<CR>]])

keymap("n", "<C-f>", function()
	vim.lsp.buf.code_action({
		filter = function(a) return a.isPreferred end,
		apply = true
	})
end)
keymap("n", "<C-r>", vim.lsp.buf.rename)

api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local arg = fn.argv(0)
		if fn.isdirectory(arg) == 1 then
			cmd("cd " .. arg)
			cmd("bwipeout!")
		end
	end,
})
