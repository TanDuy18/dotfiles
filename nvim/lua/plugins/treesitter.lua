return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.config").setup({
			auto_install = true,
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"javascript",
				"typescript",
				"tsx",
				"python",
				"java",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
