local keymap = vim.keymap

keymap.set("n", "<C-q>", ":wqa!<CR>", {})

keymap.set("n", "<C-s>", ":w<CR>", {})

keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {})

keymap.set("n", "<C-`>", ":ToggleTerm<CR>", {})

keymap.set("n", "<C-Left>", "<C-w>h", {})
keymap.set("n", "<C-Right>", "<C-w>l", {})
keymap.set("n", "<C-Down>", "<C-w>j", {})
keymap.set("n", "<C-Up>", "<C-w>k", {})

keymap.set("n", "<F5>", ":wa!<CR> :make run<CR>", {})
