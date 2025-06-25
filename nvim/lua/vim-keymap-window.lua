--This keymaps while I am using neovim-windows   

--split 
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>hs", ":split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>us",":close<CR>", { desc = "Close current split"})
--Move between windows 
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to up window" })
--Resizing pane 
vim.keymap.set("n", "<C-Up>", ":resize +4<CR>", { desc = "Increase height" })
vim.keymap.set("n", "<C-Down>", ":resize -4<CR>", { desc = "Decrease height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -4<CR>", { desc = "Decrease width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +4<CR>", { desc = "Increase width" })

