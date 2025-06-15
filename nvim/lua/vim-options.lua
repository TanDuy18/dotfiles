vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.cmd("set number")
vim.cmd("set norelativenumber")
vim.cmd("set cursorline")
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ead84e", bold = true })     -- Số dòng đang đứng
vim.api.nvim_set_hl(0, "LineNr", { fg = "#808080"})       -- Các số dòng còn lại
vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.opt.swapfile = false
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })  -- keep visual mode when using 
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ bufnr = 0 })
end)

vim.keymap.set("n","E","$")
local notify_original = vim.notify
vim.notify = function(msg, ...)
	if
		msg
		and (
			msg:match("position_encoding param is required")
			or msg:match("Defaulting to position encoding of the first client")
			or msg:match("multiple different client offset_encodings")
		)
	then
		return
	end
	return notify_original(msg, ...)
end



vim.opt.swapfile = false 
