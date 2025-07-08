vim.opt.fillchars:append({
  vert = '│',      -- split dọc
  horiz = '─',     -- split ngang
  eob = ' ',       -- xóa dấu ~ cuối file
  horizup = '┴',
  horizdown = '┬',
  vertleft = '┤',
  vertright = '├',
  verthoriz = '┼',
})

vim.keymap.set("n", "<leader>ce", function()
	local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
	if #diagnostics > 0 then
		local message = diagnostics[1].message
		vim.fn.setreg("+", message)
		print("Copied diagnostic: " .. message)
	else
		print("No diagnostic at cursor")
	end
end, { noremap = true, silent = true })


vim.keymap.set("n", "<leader>ne", vim.diagnostic.goto_next) -- next err
vim.keymap.set("n", "<leader>pe", vim.diagnostic.goto_prev) -- previous err
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
-- copy current file path (absolute) into clipboard
vim.keymap.set("n", "<leader>cp", function()
	local filepath = vim.fn.expand("%:p")
	vim.fn.setreg("+", filepath) -- Copy to Neovim clipboard
	vim.fn.system("echo '" .. filepath .. "' | pbcopy") -- Copy to macOS clipboard
	print("Copied: " .. filepath)
end, { desc = "Copy absolute path to clipboard" })

vim.keymap.set("n", "<leader>ob", function()
    local filepath = vim.fn.expand("%:p") 
    if filepath ~= "" then 
       local cmd = 'start brave "' .. filepath .. '"'    
        os.execute(cmd)
    else
        print("No file to open")
    end
end,{desc = "Open current file in browser"})



