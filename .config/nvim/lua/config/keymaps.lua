---@diagnostic disable
local keymap = vim.keymap.set
---@diagnostic enable

keymap("n", "<C-q>", ":wa!<CR>:qa!<CR>", {})
keymap("n", "<C-s>", ":wa!<CR>", {})
keymap("n", "<C-c>", ":w<CR>:bd<CR>:bnext<CR>", {})

keymap("n", "<C-n>", ":NvimTreeToggle<CR>", {})

keymap("n", "<C-Left>", "<C-w>h", {})
keymap("n", "<C-Right>", "<C-w>l", {})
keymap("n", "<C-Down>", "<C-w>j", {})
keymap("n", "<C-Up>", "<C-w>k", {})

keymap("n", "<C-TAB>", ":bnext<CR>")

keymap("v", "<A-Up>", ":m \"<-2<CR>gv=gv")
keymap("v", "<A-Down>", ":m \">+1<CR>gv=gv")

keymap("n", "<C-p>", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])
