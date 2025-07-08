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

local live_server_bufnr = nil 

vim.keymap.set("n", "<leader>ls", function()
  vim.cmd("w") 

  local filepath = vim.fn.expand("%:p")
  local filename = vim.fn.expand("%:t")
  local dir = vim.fn.fnamemodify(filepath, ":h")

  vim.cmd("belowright split | resize 15")
  vim.cmd("terminal live-server " .. dir)
  -- vim.cmd("startinsert") -- dùng để chỉnh dòng chạy 

    live_server_bufnr = vim.api.nvim_get_current_buf()  
  vim.fn.jobstart({
    "cmd.exe", "/C", "start", '""', "brave", "--new-tab", "http://127.0.0.1:8080/" .. filename
  })
  vim.notify("🚀 Đã mở Brave tại: http://127.0.0.1:8080/" .. filename)
end, { desc = "Run live-server + open browser tab" })


vim.keymap.set("n", "<leader>el", function()
  vim.fn.jobstart({ "cmd.exe", "/C", "taskkill /F /IM live-server.exe /T" }, {
    on_exit = function()
      -- Đóng terminal buffer nếu tồn tại
      if live_server_bufnr and vim.api.nvim_buf_is_loaded(live_server_bufnr) then
        vim.api.nvim_buf_delete(live_server_bufnr, { force = true })
        vim.notify("🛑 live-server stopped & terminal closed", vim.log.levels.INFO)
      else
        vim.notify("🛑 live-server stopped (no terminal to close)", vim.log.levels.INFO)
      end
      live_server_bufnr = nil -- reset lại sau khi đóng
    end,
  })
end, { desc = "Stop live-server and close terminal (Windows)" })

