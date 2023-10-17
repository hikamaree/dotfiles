-- Close all windows
vim.keymap.set("n", "<C-q>", ":wqa!<CR>", {})

-- Fast saving
vim.keymap.set("n", "<C-s>", ":w<CR>", {})

-- NvimTree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {})

-- Terminal
vim.keymap.set("n", "<C-`>", ":ToggleTerm<CR>", {})

vim.keymap.set("n", "<C-Left>", "<C-w>h", {})
vim.keymap.set("n", "<C-Right>", "<C-w>l", {})
vim.keymap.set("n", "<C-Down>", "<C-w>j", {})
vim.keymap.set("n", "<C-Up>", "<C-w>k", {})
