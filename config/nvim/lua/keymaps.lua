vim.keymap.set({"n", "v", "i", "t"}, "<C-q>", [[<CMD>lua require("FTerm").exit()<CR><CMD>wa!<CR><CMD>qa!<CR>]])
vim.keymap.set("n", "<C-s>", "<CMD>wa!<CR>")

vim.keymap.set("n", "<C-c>", [[<CMD>w<CR><CMD>bd<CR><CMD>bnext<CR>]])
vim.keymap.set("n", "<C-TAB>", [[<CMD>bnext<CR>]])
vim.keymap.set("n", "<C-S-TAB>", [[<CMD>bprev<CR>]])

vim.keymap.set({"n", "t"}, "<C-Left>", [[<C-w>h]])
vim.keymap.set({"n", "t"}, "<C-Right>", [[<C-w>l]])
vim.keymap.set({"n", "t"}, "<C-Down>", [[<C-w>j]])
vim.keymap.set({"n", "t"}, "<C-Up>", [[<C-w>k]])

vim.keymap.set({"n", "t"}, "<C-S-Left>", [[<CMD>vertical resize -2<CR>]])
vim.keymap.set({"n", "t"}, "<C-S-Right>", [[<CMD>vertical resize +2<CR>]])
vim.keymap.set({"n", "t"}, "<C-S-Up>", [[<CMD>horizontal resize -1<CR>]])
vim.keymap.set({"n", "t"}, "<C-S-Down>", [[<CMD>horizontal resize +1<CR>]])

vim.keymap.set("x", "<A-Up>", [[:move '<-2<CR>gv-gv]])
vim.keymap.set("x", "<A-Down>", [[:move '>+1<CR>gv-gv]])

vim.keymap.set("n", "<C-p>", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<C-p>", [["hy:%s/<C-r>h/<C-r>h/gI<Left><Left><Left>]])

vim.keymap.set("t", "<C-Enter>", [[<CMD>lua require("FTerm").toggle()<CR>]])
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>')
