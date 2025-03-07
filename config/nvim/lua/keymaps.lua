vim.keymap.set({"n", "v", "i", "t"}, "<C-Q>", function() vim.cmd([[wa!]]) vim.cmd([[qa!]]) end, { desc = "Save all files and quit nvim" })
vim.keymap.set("n", "<Esc>", function() vim.cmd([[nohlsearch]]) end, { desc = "Remove search highlight" })
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste without overriding clipboard" })
vim.keymap.set("n", "<C-c>", function() pcall(vim.cmd, [[w!]]) vim.cmd([[bd!]]) vim.cmd([[bnext]]) end, { desc = "Save and close buffer" })
vim.keymap.set({"n", "t"}, "<C-H>", function() vim.cmd([[bprev]]) end, { desc = "Go to previous buffer" })
vim.keymap.set({"n", "t"}, "<C-L>", function() vim.cmd([[bnext]]) end, { desc = "Go to next buffer" })
vim.keymap.set("n", "<C-S-H>", function() pcall(vim.cmd, [[cprev]]) end, { desc = "Go to previous search result" })
vim.keymap.set("n", "<C-S-L>", function() pcall(vim.cmd, [[cnext]]) end, { desc = "Go to next search result" })
vim.keymap.set({"n", "t"}, "<C-Left>", function() vim.cmd([[wincmd h]]) end, { desc = "Navigate to the left window" })
vim.keymap.set({"n", "t"}, "<C-Right>", function() vim.cmd([[wincmd l]]) end, { desc = "Navigate to the right window" })
vim.keymap.set({"n", "t"}, "<C-Down>", function() vim.cmd([[wincmd j]]) end, { desc = "Navigate to the bottom window" })
vim.keymap.set({"n", "t"}, "<C-Up>", function() vim.cmd([[wincmd k]]) end, { desc = "Navigate to the top window" })
vim.keymap.set({"n", "t"}, "<C-S-Left>", function() vim.cmd([[vert res -2]]) end, { desc = "Resize window horizontally (decrease)" })
vim.keymap.set({"n", "t"}, "<C-S-Right>", function() vim.cmd([[vert res +2]]) end, { desc = "Resize window horizontally (increase)" })
vim.keymap.set({"n", "t"}, "<C-S-Up>", function() vim.cmd([[hor res -1]]) end, { desc = "Resize window vertically (decrease)" })
vim.keymap.set({"n", "t"}, "<C-S-Down>", function() vim.cmd([[hor res +1]]) end, { desc = "Resize window vertically (increase)" })
vim.keymap.set("n", "<C-P>", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor globally in the current file" })
vim.keymap.set("v", "<C-P>", [["hy:%s/<C-r>h/<C-r>h/gI<Left><Left><Left>]], { desc = "Replace selected text globally in the current file" })
vim.keymap.set("n", "<C-\\>", vim.diagnostic.open_float, { desc = "Open diagnostic message in a floating window" })
vim.keymap.set("n", "<C-[>", vim.diagnostic.goto_prev, { desc = "Go to the previous diagnostic message" })
vim.keymap.set("n", "<C-]>", vim.diagnostic.goto_next, { desc = "Go to the next diagnostic message" })
vim.keymap.set("t", "<Esc>", function() vim.cmd([[stopinsert]]) end, { desc = "Exit insert mode in terminal" })
