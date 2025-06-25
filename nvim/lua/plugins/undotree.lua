return {
	"mbbill/undotree",
	config = function()
		-- Gán phím <leader>ut để bật/tắt cửa sổ Undotree
		vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)

		-- Gán phím <leader>uf để focus vào cửa sổ Undotree (nếu đang mở)
		vim.keymap.set("n", "<leader>uf", vim.cmd.UndotreeFocus)
	end,
}

