vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.g.maplocaleader = " "
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set cursorline")
vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.mouse = ""
-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- paste over highlight word
vim.keymap.set("x", "<leader>p", '"_dP')
vim.opt.colorcolumn = ""
vim.opt.fillchars = { eob = " " }
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
-- wrap text
vim.opt.swapfile = false
vim.opt.wrap = true
vim.opt.linebreak = true
-- vim.opt.breakindent = true
-- vim.opt.showbreak = "↳\\"
-- fk llm-ls
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
