vim.keymap.set("n", "<leader>cp", function()
    local filepath = vim.fn.expand("%:p")
    vim.fn.setreg("+", filepath)                        -- Copy to Neovim clipboard
    vim.fn.system("echo '" .. filepath .. "' | pbcopy") -- Copy to macOS clipboard
    print("Copied: " .. filepath)
end, { desc = "Copy absolute path to clipboard" })


-- all vim helper functions here

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

-- go to errors in a file :/

vim.keymap.set("n", "<leader>ne", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Next diagnostic" })

vim.keymap.set("n", "<leader>pe", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Prev diagnostic" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

vim.diagnostic.config({
  float = {
    border = "rounded", 
    source = "always",
  },
})
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.diagnostic.config({ virtual_text = false })
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.diagnostic.config({ virtual_text = true })
	end,
})
