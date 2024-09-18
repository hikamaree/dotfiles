vim.keymap.set({"n", "v", "i", "t"}, "<C-q>", [[<CMD>wa!<CR><CMD>qa!<CR>]])
vim.keymap.set("n", "<C-s>", "<CMD>wa!<CR>")
vim.keymap.set('n', '<Esc>', '<CMD>nohlsearch<CR>')
vim.keymap.set("x", "p", [["_dP]])

vim.keymap.set("n", "<C-c>", [[<CMD>w!<CR><CMD>bd<CR><CMD>bnext<CR>]])
vim.keymap.set({"n", "t"}, "<C-TAB>", [[<CMD>bnext<CR>]])
vim.keymap.set({"n", "t"}, "<C-S-TAB>", [[<CMD>bprev<CR>]])
vim.keymap.set("n", "<C-,>", [[<CMD>cprev<CR>]])
vim.keymap.set("n", "<C-.>", [[<CMD>cnext<CR>]])

vim.keymap.set({"n", "t"}, "<C-Left>", [[<CMD>wincmd h<CR>]])
vim.keymap.set({"n", "t"}, "<C-Right>", [[<CMD>wincmd l<CR>]])
vim.keymap.set({"n", "t"}, "<C-Down>", [[<CMD>wincmd j<CR>]])
vim.keymap.set({"n", "t"}, "<C-Up>", [[<CMD>wincmd k<CR>]])
vim.keymap.set({"n", "t"}, "<C-S-Left>", [[<CMD>vertical resize -2<CR>]])
vim.keymap.set({"n", "t"}, "<C-S-Right>", [[<CMD>vertical resize +2<CR>]])
vim.keymap.set({"n", "t"}, "<C-S-Up>", [[<CMD>horizontal resize -1<CR>]])
vim.keymap.set({"n", "t"}, "<C-S-Down>", [[<CMD>horizontal resize +1<CR>]])

vim.keymap.set("x", "<A-Up>", [[:move '<-2<CR>gv-gv]])
vim.keymap.set("x", "<A-Down>", [[:move '>+1<CR>gv-gv]])

vim.keymap.set("n", "<C-p>", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<C-p>", [["hy:%s/<C-r>h/<C-r>h/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-/>", vim.diagnostic.open_float)
vim.keymap.set("n", "<C-[>", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<C-]>", vim.diagnostic.goto_next)

vim.keymap.set("n", "<C-Enter>", [[<CMD>bo sp | res 15 | term<CR><CMD>set nonu nornu<CR>i]])
vim.keymap.set("t", "<C-Enter>", [[<CMD>bd!<CR>]])
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>')
