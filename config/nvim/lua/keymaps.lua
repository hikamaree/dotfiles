vim.keymap.set({"n", "v", "i", "t"}, "<C-Q>", function() vim.cmd([[wa!]]) vim.cmd([[qa!]]) end)
vim.keymap.set('n', "<Esc>", function() vim.cmd([[nohlsearch]]) end)
vim.keymap.set("x", "p", [["_dP]])

vim.keymap.set("n", "<C-c>", function()  pcall(vim.cmd, [[w!]]) vim.cmd([[bd!]]) vim.cmd([[bnext]]) end)
vim.keymap.set({"n", "t"}, "<C-,>", function() vim.cmd([[bprev]]) end)
vim.keymap.set({"n", "t"}, "<C-.>", function() vim.cmd([[bnext]]) end)
vim.keymap.set("n", "<C-S-,>", function() pcall(vim.cmd, [[cprev]]) end)
vim.keymap.set("n", "<C-S-.>", function() pcall(vim.cmd, [[cnext]]) end)

vim.keymap.set({"n", "t"}, "<C-Left>", function() vim.cmd([[wincmd h]]) end)
vim.keymap.set({"n", "t"}, "<C-Right>", function() vim.cmd([[wincmd l]]) end)
vim.keymap.set({"n", "t"}, "<C-Down>", function() vim.cmd([[wincmd j]]) end)
vim.keymap.set({"n", "t"}, "<C-Up>", function() vim.cmd([[wincmd k]]) end)

vim.keymap.set({"n", "t"}, "<C-S-Left>", function() vim.cmd([[vert res -2]]) end)
vim.keymap.set({"n", "t"}, "<C-S-Right>", function() vim.cmd([[vert res +2]]) end)
vim.keymap.set({"n", "t"}, "<C-S-Up>", function() vim.cmd([[hor res -1]]) end)
vim.keymap.set({"n", "t"}, "<C-S-Down>", function() vim.cmd([[hor res +1]]) end)

vim.keymap.set("x", "<A-Up>", [[:move '<-2<CR>gv-gv]])
vim.keymap.set("x", "<A-Down>", [[:move '>+1<CR>gv-gv]])

vim.keymap.set("n", "<C-P>", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<C-P>", [["hy:%s/<C-r>h/<C-r>h/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-\\>", vim.diagnostic.open_float)
vim.keymap.set("n", "<C-[>", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<C-]>", vim.diagnostic.goto_next)

vim.keymap.set("t", "<C-Enter>", function() vim.cmd([[bd!]]) end)
vim.keymap.set("t", "<Esc>", function() vim.cmd([[stopinsert]]) end)
vim.keymap.set("n", "<C-Enter>", function()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[buf].buftype == "terminal" then
			vim.api.nvim_buf_delete(buf, {force = true})
			return
		end
	end
	vim.cmd([[bo sp | res 15 | term]])
	vim.cmd([[set nonu nornu signcolumn=no]])
	vim.cmd([[startinsert]])
end)