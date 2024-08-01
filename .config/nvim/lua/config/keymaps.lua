---@diagnostic disable
local keymap = vim.keymap.set
---@diagnostic enable

keymap({"n", "v", "i", "t"}, "<C-q>", "<CMD>lua require('FTerm').exit()<CR><CMD>wa!<CR><CMD>qa!<CR>", {})
keymap("n", "<C-s>", "<CMD>wa!<CR>", {})
keymap("n", "<C-c>", "<CMD>w<CR><CMD>bd<CR><CMD>bnext<CR>", {})

keymap("n", "<C-n>", "<CMD>NvimTreeToggle<CR>", {})

keymap("n", "<C-Left>", "<C-w>h", {})
keymap("n", "<C-Right>", "<C-w>l", {})
keymap("n", "<C-Down>", "<C-w>j", {})
keymap("n", "<C-Up>", "<C-w>k", {})

keymap("n", "<C-TAB>", "<CMD>bnext<CR>")
keymap("n", "<C-S-TAB>", "<CMD>bprev<CR>")

keymap("v", "<A-Up>", "<CMD>m \"<-2<CR>gv=gv")
keymap("v", "<A-Down>", "<CMD>m \">+1<CR>gv=gv")

keymap("n", "<C-p>", [[<CMD>%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap("n", "<C-Enter>", "<CMD>lua require('FTerm').toggle()<CR>")
keymap("t", "<C-Enter>", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")
keymap("t", "<Esc>", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")
