return {
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 900,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
	}, 
    {
     'rmehri01/onenord.nvim',
     name = "onenord",
     priority = 1300,
     config = function()
        local themes = {
				"kanagawa",
				"rose-pine",
                "onenord",
                "catppuccin",
                "tokyonight"
			}

			local current_theme_index = 4
			-- Set default theme (first theme)
			vim.cmd.colorscheme(themes[current_theme_index])

			-- Key mapping to switch themes (e.g., <leader>nt)
			vim.keymap.set("n", "<leader>nt", function()
				current_theme_index = current_theme_index + 1
				if current_theme_index > #themes then
					current_theme_index = 1
				end
				local theme = themes[current_theme_index]
				vim.cmd.colorscheme(theme)
				print("Change nvim theme to: " .. theme)
			end, { noremap = true, silent = true })
		end, 
    },
    {
     "catppuccin/nvim", name = "catppuccin",
     priority = 1400,
     lazy = false ,
     config = function() 
        vim.g.catppuccin_flavour = "Macchiato"
        require("catppuccin").setup({})
        vim.cmd.colorscheme("catppuccin")
     end,
    },
    {
     "folke/tokyonight.nvim",
      lazy = false,
        name = "tokyonight",
      priority = 900,
    }
}

