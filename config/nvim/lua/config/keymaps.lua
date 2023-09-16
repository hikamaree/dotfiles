-- Close all windows and exit from Neovim with <leader> and q
vim.keymap.set("n", "<leader>q", ":wqa!<CR>", {})
-- Fast saving with <leader> and s
vim.keymap.set("n", "<leader>s", ":w<CR>", {})

-- Reload configuration without restart nvim
vim.keymap.set("n", "<leader>r", ":so %<CR>", {})

-- NvimTree
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", {})
vim.keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", {})
